//
//  UXActionSheetPresentable.swift
//  UXActionSheet
//
//  Created by Jack Chamberlain on 20/04/2016.
//  Copyright © 2016 jackchmbrln. All rights reserved.
//

import Foundation
import UIKit

protocol UXActionSheetPresentable {
    func presentActionSheet(withAction actions: Array<UXAction>) -> Void
}

protocol UXActionSheetStylable {
    var style: UXActionStyle? { get }
}

extension UXActionSheetPresentable where Self: UIViewController {
    func presentActionSheet(withAction actions: Array<UXAction>) -> Void {
        let sheet = UXActionSheet(actions: actions)
        sheet.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        sheet.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(sheet, animated: true, completion: nil)
    }
}

public func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}
