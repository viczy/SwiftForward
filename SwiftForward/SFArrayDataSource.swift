//
//  SFArrayDataSource.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/18/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import UIKit

typealias TableCellConfigureBlock = (UITableViewCell, AnyObject) -> Void

class SFArrayDataSource: NSObject, UITableViewDataSource {
    //MARK:Property
    private var items:Array<AnyObject>?
    private var cellIdentifier:String?
    private var configureCellBlock:TableCellConfigureBlock?

    override init() {
        super.init()
    }

    //MARK:Init
    convenience init(items anItems:Array<AnyObject>?, cellIdentifier aCellidentifier:String?, configureCellBlock aConfigureCellBlock:TableCellConfigureBlock?) {
        self.init();
        self.items = anItems
        self.cellIdentifier = aCellidentifier
        self.configureCellBlock = aConfigureCellBlock
    }

    //MARK:UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myItems = items {
            return myItems.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier!, forIndexPath: indexPath) as? UITableViewCell
        if let myItems = items {
            var item:AnyObject = myItems[indexPath.row]
            if let myConfigureCellBlock = configureCellBlock {
                myConfigureCellBlock(cell!, item)
            }
        }
        return cell!
    }

}
