//
//  SplitViewController.swift
//  Tabata
//
//  Created by Lamb, Christopher Charles on 3/16/16.
//  Copyright © 2016 gbsw. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func splitViewController(
        splitViewController: UISplitViewController,
        collapseSecondaryViewController secondaryViewController: UIViewController,
        ontoPrimaryViewController primaryViewController: UIViewController
    ) -> Bool{
        return true
    }
    
}