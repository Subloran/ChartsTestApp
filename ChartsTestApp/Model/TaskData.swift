//
//  TaskData.swift
//  ChartsTestApp
//
//  Created by Artem on 20/10/15.
//  Copyright © 2015 Artem. All rights reserved.
//

import UIKit

class TaskData: NSObject
{
    var name: NSString!
    var status: NSString!
    var incidentsNumber: NSInteger!
    var person: NSString!
    var personImage: UIImage!
    var values: NSArray?
    
    init(name: NSString?, status: NSString?, incidentsNumber: NSInteger?, person: NSString?, personImage: UIImage?)
    {
        super.init();
        self.name = name;
        self.status = status;
        self.incidentsNumber = incidentsNumber;
        self.person = person;
        self.personImage = personImage;
        
        let tmpValues = NSMutableArray();
        for (var i = 0; i < 100; i++)
        {
            tmpValues.addObject(NSNumber(int: (rand()%50 + 50)));
        }
        values = tmpValues.copy() as? NSArray;
    }
}
