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
    private var tableView: UITableView!
    private var menuArray: NSArray!

    //MARK:Init
    override init() {
        super.init()
        self.propertyInit()
    }

    override init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    //MARK:Load&Appear
    override func loadView() {
        super.loadView()
        self.tableViewLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:Property Init
    private func propertyInit() {
        //tableView
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        //menuArray
        menuArray = ["Refresh", "Alamofire", "Realm"]
    }

    //MARK:Layout
    private func tableViewLayout() {
        self.view.addSubview(self.tableView)
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

