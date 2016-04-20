//
//  UXActionSheet.swift
//  Urbexplore Connect
//
//  Created by Jack Chamberlain on 23/12/2015.
//  Copyright © 2015 Urbexplore. All rights reserved.
//

import UIKit

class UXActionSheet: UIViewController, UXActionSheetStylable {

    // MARK: Outlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightCS: NSLayoutConstraint!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var cancelBtnBtmCS: NSLayoutConstraint!
    
    let cellHeight: CGFloat = 60.0
    var style: UXActionStyle?
    
    // MARK: Variables
    var actions: [UXAction]!
    
    init(actions: [UXAction]) {
        self.actions = actions
        super.init(nibName: "UXActionSheet", bundle: NSBundle.mainBundle())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Register table view cells
        self.tableView.registerNib(UINib(nibName: "UXActionSheetCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "actionCell")
        
        // Tap gesture for dismiss the action sheet
        let tap = UITapGestureRecognizer(target: self, action: #selector(UXActionSheet.dismissActionSheet))
        self.backgroundView.addGestureRecognizer(tap)
        
        // MARK: Set Delegate and Data Source
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // MARK: Set table view style
        self.tableView.separatorStyle = .None
        
        self.cancelBtnBtmCS.constant = -(CGFloat(self.actions.count) * self.cellHeight) - self.cancelBtn.bounds.height
        self.tableViewHeightCS.constant = CGFloat(self.actions.count) * self.cellHeight
        self.view.layoutIfNeeded()
        
        delay(0.1) {
            self.cancelBtnBtmCS.constant = 0.0
            UIView.animateWithDuration(0.2) { () -> Void in
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
    }
    
    private func setAppearance() {
        guard let font = self.style?.font else { return }
        self.cancelBtn.titleLabel?.font = font
    }
    
    // MARK: Dismiss action sheet
    func dismissActionSheet() {
        self.cancelBtnBtmCS.constant = -(CGFloat(self.actions.count) * self.cellHeight) - self.cancelBtn.bounds.height
        
        UIView.animateWithDuration(0.3, animations: { 
            self.view.layoutIfNeeded()
            }) { (success) in
                self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissActionSheet()
    }
}

// MARK: Table view delegates
extension UXActionSheet: UITableViewDataSource, UITableViewDelegate {
    // MARK: Number of sections in table
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    // MARK: Cell for row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("actionCell", forIndexPath: indexPath) as! UXActionSheetCell
        cell.setCell(withAction: self.actions[indexPath.row])
        return cell
    }
    
    // MARK: Select row at index path
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.actions[indexPath.row].completion()
        self.dismissActionSheet()
    }
    
    // MARK: Height for row
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.cellHeight
    }
}
