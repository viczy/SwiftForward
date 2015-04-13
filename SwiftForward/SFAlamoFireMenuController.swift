//
//  SFAlamoFireController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/13/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Cartography

enum AFMenuIndex:Int {
    case List = 0, Compose, Update
}

class SFAlamoFireMenuController: SFBaseController, UITableViewDelegate {
    //MARK:Property
    let menuArray = ["List", "Compose", "UPdate"]
    let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    private var dataSource:SFArrayDataSource?

    //MARK:Init
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    //MARK:Load&Appear
    override func loadView() {
        super.loadView()
        self.setUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:SetUP View
    private func setUpView() {
        //tableView
        let identifier = "menuIdentifier"
        dataSource = SFArrayDataSource(items: menuArray, cellIdentifier: identifier, configureCellBlock:configureCell)
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        layout(tableView) { view in
            view.edges == inset(view.superview!.edges, 0, 0, 0, 0); return
        }
    }

    func configureCell(aCell:UITableViewCell, aItem:AnyObject) {
        aCell.textLabel?.text = aItem as? String
    }

    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var controller:SFBaseController?
        if let index = AFMenuIndex(rawValue: indexPath.row) {
            switch index {
            case .List:
                return

            case .Compose:
                return

            case .Update:
                return
            }

        }
        if let myController = controller {
            self.navigationController?.pushViewController(myController, animated: true)
        }
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}