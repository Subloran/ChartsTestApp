//
//  MainTableController.swift
//  ChartsTestApp
//
//  Created by Artem on 20/10/15.
//  Copyright © 2015 Artem. All rights reserved.
//

import UIKit

class MainTableController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var mainTable: UITableView!
    let mainTableViewCellReuseIdentifier = "mainTableViewCell"
    var dataArray: NSArray = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Main table";
        mainTable.registerNib(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: mainTableViewCellReuseIdentifier);
        DataProvider.sharedInstance.loadData { [weak self] (result) -> Void in
            self?.dataArray = result;
            self?.mainTable.reloadData();
        }
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask
    {
        if (UIDevice.currentDevice().userInterfaceIdiom == .Pad)
        {
            return UIInterfaceOrientationMask.All;
        }
        else
        {
            return UIInterfaceOrientationMask.Portrait;
        }
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(mainTableViewCellReuseIdentifier) as! MainTableViewCell;
        cell.backgroundColor = tableView.backgroundColor;
        cell.setTaskData(dataArray[indexPath.row] as! TaskData);
        return cell;
    }
    
// MARK: - UITableViewDelegate

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 229;
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return CGFloat.min;
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return CGFloat.min;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: false);
        let chartController = ChartViewController();
        chartController.task = dataArray[indexPath.row] as? TaskData;
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target:nil, action:nil);
        self.navigationController?.pushViewController(chartController, animated: true);
    }
}
