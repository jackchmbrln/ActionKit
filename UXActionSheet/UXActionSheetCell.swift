//
//  UXActionSheetCell.swift
//  Urbexplore Connect
//
//  Created by Jack Chamberlain on 23/12/2015.
//  Copyright © 2015 Urbexplore. All rights reserved.
//

import UIKit

class UXActionSheetCell: UITableViewCell {
    // MARK: Outlets
    @IBOutlet weak var actionTitle: UILabel!
    
    // MARK: Variables
    var style: UXActionStyle?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
