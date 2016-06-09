//
//  UXActionStyle.swift
//  UXActionSheet
//
//  Created by Jack Chamberlain on 20/04/2016.
//  Copyright © 2016 jackchmbrln. All rights reserved.
//

import UIKit

public enum UXActionSheetType {
    case Default
    case Destructive
}

public struct UXActionStyle {
    public var font: UIFont?
    public var size: CGFloat?
    public var defaultColor: UIColor?
    public var destructiveColor: UIColor?
    public var backgroundColor: UIColor?
    
    public init(font: UIFont?, size: CGFloat?, defaultColor: UIColor?, destructiveColor: UIColor?, backgroundColor: UIColor?) {
        self.font = font
        self.size = size
        self.defaultColor = defaultColor
        self.destructiveColor = destructiveColor
        self.backgroundColor = backgroundColor
    }
    
    public init() {
        self.font = UIFont.systemFontOfSize(15)
        self.size = 15
        self.defaultColor = UIColor.blackColor()
        self.destructiveColor = UIColor.redColor()
        self.backgroundColor = UIColor.whiteColor()
    }
}
