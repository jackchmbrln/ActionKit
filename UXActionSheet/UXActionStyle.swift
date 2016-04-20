//
//  UXActionStyle.swift
//  UXActionSheet
//
//  Created by Jack Chamberlain on 20/04/2016.
//  Copyright © 2016 jackchmbrln. All rights reserved.
//

import UIKit

enum UXActionSheetType {
    case Default
    case Destructive
}

struct UXActionStyle {
    var font: UIFont?
    var size: CGFloat?
    var defaultColor: UIColor?
    var destructiveColor: UIColor?
}
