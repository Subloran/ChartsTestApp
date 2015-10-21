//
//  MainTableViewCell.swift
//  ChartsTestApp
//
//  Created by Artem on 20/10/15.
//  Copyright © 2015 Artem. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell
{
    @IBOutlet var mainContainer: UIView!
    @IBOutlet var taskName: UILabel!
    @IBOutlet var taskStatus: UILabel!
    @IBOutlet var numberOfIncinents: UILabel!
    @IBOutlet var person: UILabel!
    @IBOutlet var personImage: UIImageView!
    @IBOutlet var centerBorderHeight: NSLayoutConstraint!
    @IBOutlet var buttonsBorderHeight: NSLayoutConstraint!
    
    var _taskData: TaskData?
    
    internal func setTaskData(taskData: TaskData)
    {
        taskName.text = taskData.name! as String;
        taskStatus.text = taskData.status! as String;
        numberOfIncinents.text = "\(taskData.incidentsNumber)";
        person.text = taskData.person! as String;
    }

    override func awakeFromNib()
    {
        super.awakeFromNib()
        mainContainer.layer.cornerRadius = 5;
        if (UIScreen.mainScreen().scale > 1)
        {
            centerBorderHeight.constant = 0.5;
            buttonsBorderHeight.constant = 0.5;
        }
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
// MARK:- Buttons
    
    @IBAction func callButtonPressed(sender: UIButton)
    {
    }
    
    @IBAction func chatButtonPressed(sender: UIButton)
    {
    }
}
