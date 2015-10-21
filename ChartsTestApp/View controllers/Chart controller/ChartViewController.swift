//
//  ChartViewController.swift
//  ChartsTestApp
//
//  Created by Artem on 20/10/15.
//  Copyright © 2015 Artem. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController
{
    @IBOutlet var chartView: LineChartView!
    
    var task: TaskData?
    
    override func viewDidLoad()
    {
        super.viewDidLoad();

        self.title = "Chart";
        if (task?.name != nil)
        {
            self.title = "Chart for task \(task?.name)";
        }
        
        let valuesCount = task?.values?.count;
        let xVals = NSMutableArray(capacity: valuesCount!);
        for (var i = 0; i < valuesCount; i++)
        {
            xVals.addObject("\(i)");
        }
        let dataSets = NSMutableArray();
        
        if true
        {
            let yVals = NSMutableArray(capacity: valuesCount!);
            for (var i = 0; i < 2; i++)
            {
                let entry = ChartDataEntry(value: 50, xIndex: i * 100);
                yVals.addObject(entry);
            }
            let dataSet = LineChartDataSet(yVals: yVals.copy() as? [ChartDataEntry]);
            dataSet.label = "";
            dataSet.circleRadius = 0;
            let lineDashes = NSMutableArray(capacity: valuesCount!);
            lineDashes.addObject(5);
            dataSet.lineDashLengths = lineDashes.copy() as! [CGFloat];
            dataSets.addObject(dataSet);
        }
        
        if true
        {
            let yVals = NSMutableArray(capacity: valuesCount!);
            for (var i = 1; i < 3; i++)
            {
                let entry = ChartDataEntry(value: Double(50 * i), xIndex: 50);
                yVals.addObject(entry);
            }
            let dataSet = LineChartDataSet(yVals: yVals.copy() as? [ChartDataEntry]);
            dataSet.label = "";
            dataSet.circleRadius = 0;
            let lineDashes = NSMutableArray(capacity: valuesCount!);
            lineDashes.addObject(5);
            dataSet.lineDashLengths = lineDashes.copy() as! [CGFloat];
            dataSets.addObject(dataSet);
        }
        
        if true
        {
            let yVals = NSMutableArray(capacity: valuesCount!);
            for (var i = 0; i <= valuesCount! / 2; i++)
            {
                let value: NSNumber = (task?.values?.objectAtIndex(i))! as! NSNumber;
                let entry = ChartDataEntry(value: value.doubleValue, xIndex: i);
                yVals.addObject(entry);
            }
            let dataSet = LineChartDataSet(yVals: yVals.copy() as? [ChartDataEntry]);
            dataSet.label = "";
            dataSet.circleRadius = 0;
            dataSets.addObject(dataSet);
        }
        
        if true
        {
            let yVals = NSMutableArray(capacity: valuesCount!);
            for (var i = valuesCount! / 2; i < valuesCount; i++)
            {
                let value: NSNumber = (task?.values?.objectAtIndex(i))! as! NSNumber;
                let entry = ChartDataEntry(value: value.doubleValue, xIndex: i);
                yVals.addObject(entry);
            }
            let dataSet = LineChartDataSet(yVals: yVals.copy() as? [ChartDataEntry]);
            dataSet.label = "";
            dataSet.circleRadius = 0;
            let lineDashes = NSMutableArray(capacity: valuesCount!);
            lineDashes.addObject(5);
            dataSet.lineDashLengths = lineDashes.copy() as! [CGFloat];
            dataSets.addObject(dataSet);
        }
    
        let chartData = LineChartData(xVals: xVals.copy() as? [NSObject], dataSets: dataSets.copy() as? [ChartDataSet]);
        chartView.gridBackgroundColor = UIColor.clearColor();
        chartView.scaleYEnabled = false;
        chartView.leftAxis.startAtZeroEnabled = false;
        chartView.leftAxis.customAxisMin = 45;
        chartView.rightAxis.startAtZeroEnabled = false;
        chartView.rightAxis.customAxisMin = 45;
        chartView.legend.setCustom(colors: [UIColor.clearColor()], labels: [""]);
        chartView.descriptionText = "Данные получены рандомом";
        chartView.data = chartData;
    }
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval)
    {
        chartView.setNeedsDisplay();
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
