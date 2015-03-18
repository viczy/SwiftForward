//
//  SFArrayDataSource.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/18/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import UIKit

typealias CellConfigureBlock = (UITableViewCell, AnyObject) -> Void

class SFArrayDataSource: NSObject, UITableViewDataSource {
    //MARK:Property
    var items:NSArray?
    var cellIdentifier:String?
    var configureCellBlock:CellConfigureBlock?

    override init() {
        super.init()
    }

    //MARK:Init
    convenience init(items anItems:NSArray?, cellIdentifier aCellidentifier:String?, configureCellBlock aConfigureCellBlock:CellConfigureBlock?) {
        self.init();
        self.items = anItems
        self.cellIdentifier = aCellidentifier
        self.configureCellBlock = aConfigureCellBlock
    }

    //MARK:UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier!, forIndexPath: indexPath) as? UITableViewCell

        if let myItems = items {
            var item:AnyObject = myItems[indexPath.row]
            configureCellBlock!(cell!, item)
        }
        return cell!
    }

}
