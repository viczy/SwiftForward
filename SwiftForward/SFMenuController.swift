//
//  ViewController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/11/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import UIKit
import Cartography

class SFMenuController: SFBaseController {
    //MARK:Property
    private var menuArray: NSArray!
    private var tableView: UITableView!
    private var arrayDataSource: SFArrayDataSource!

    //MARK:Init
    override init() {
        super.init()
        self.propertyInit()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    //MARK:Load&Appear
    override func loadView() {
        super.loadView()
        tableViewLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:Property Init
    private func propertyInit() {
        //menuArray
        menuArray = ["Refresh", "Alamofire", "Realm"]

        //tableView
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        var configureBlock:CellConfigureBlock = configureCell
        let identifier = "menuIdentifier"
        arrayDataSource = SFArrayDataSource(items: menuArray, cellIdentifier: "menuIdentifier", configureCellBlock: configureBlock)
        tableView.dataSource = arrayDataSource
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
    }

    func configureCell(aCell:UITableViewCell, aItem:AnyObject) {
        aCell.textLabel?.text = aItem as? String
    }

    //MARK:Layout
    private func tableViewLayout() {
        self.view.addSubview(tableView)
        layout(tableView) { view in
            view.edges == inset(view.superview!.edges, 0, 0, 0, 0); return
        }
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

