//
//  Extensions.swift
//  ChartsTestApp
//
//  Created by Artem on 21/10/15.
//  Copyright © 2015 Artem. All rights reserved.
//

import UIKit

extension UINavigationController
{    
    override public func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return (self.topViewController?.supportedInterfaceOrientations())!;
    }
}
