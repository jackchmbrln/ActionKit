//
//  UXAction.swift
//  UXActionSheet
//
//  Created by Jack Chamberlain on 20/04/2016.
//  Copyright © 2016 jackchmbrln. All rights reserved.
//

import Foundation
import UIKit

public struct UXAction {
    public var title: String!
    public var type: UXActionSheetType!
    public var completion: (()->Void)
    
    public init(title: String, type: UXActionSheetType, completion: (()->Void)) {
        self.title = title
        self.type = type
        self.completion = completion
    }
}