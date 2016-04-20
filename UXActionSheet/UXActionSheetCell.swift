//
//  UXActionSheetCell.swift
//  Urbexplore Connect
//
//  Created by Jack Chamberlain on 23/12/2015.
//  Copyright © 2015 Urbexplore. All rights reserved.
//

import UIKit

class UXActionSheetCell: UITableViewCell, UXActionSheetStylable {
    // MARK: Outlets
    @IBOutlet weak var actionTitle: UILabel!
    
    var style: UXActionStyle?
    
    // MARK: Variables
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.style = UXActionStyle(font: UIFont.systemFontOfSize(15), size: 15.0, defaultColor: UIColor.blackColor(), destructiveColor: UIColor.redColor())
        self.selectionStyle = .None
    }
    
    // MARK: Apply styling to cell
    func setCell(withAction action: UXAction) {
        self.actionTitle.text = action.title
        if action.type == UXActionSheetType.Default {
            self.actionTitle.textColor = self.style?.defaultColor
        }
        else {
            self.actionTitle.textColor = self.style?.destructiveColor
        }
    }
}
