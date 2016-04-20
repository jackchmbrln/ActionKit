//
//  ViewController.swift
//  UXActionSheet
//
//  Created by Jack Chamberlain on 20/04/2016.
//  Copyright © 2016 jackchmbrln. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UXActionSheetPresentable {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let defaultAction = UXAction(title: "Hello", type: UXActionSheetType.Default) {
            print("Handle default action")
        }
        
        let destructiveAction = UXAction(title: "Destructive", type: UXActionSheetType.Destructive) { 
            print("Handle destructive action")
        }
        
        self.presentActionSheet(withAction: [defaultAction, destructiveAction])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

