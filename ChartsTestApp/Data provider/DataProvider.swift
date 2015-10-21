//
//  DataProvider.swift
//  ChartsTestApp
//
//  Created by Artem on 20/10/15.
//  Copyright © 2015 Artem. All rights reserved.
//

import UIKit

class DataProvider: NSObject
{
    static let sharedInstance = DataProvider();
    
    func loadData(completion: (result: NSArray) -> Void)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)) { [weak self] in
            self?.loadDataCompleted(completion);
        }
    }
    func loadDataCompleted(completion: (result: NSArray) -> Void)
    {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            let array = NSMutableArray();
            for (var i = 0; i < 100; i++)
            {
                let task = TaskData(name: "Name \(i)", status: "Status \(i)", incidentsNumber: NSInteger(rand()%100), person: "Person \(i)", personImage: nil);
                array.addObject(task);
            }
            completion(result: array.copy() as! NSArray);
        }
    }
}
