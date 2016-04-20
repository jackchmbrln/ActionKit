//
//  UXAction.swift
//  UXActionSheet
//
//  Created by Jack Chamberlain on 20/04/2016.
//  Copyright © 2016 jackchmbrln. All rights reserved.
//

import Foundation
import UIKit

struct UXAction {
    var title: String!
    var type: UXActionSheetType!
//    var target: AnyObject?
//    var action: Selector?
    var completion: (()->Void)
}