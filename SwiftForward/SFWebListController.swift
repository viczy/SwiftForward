//
//  SFWebController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/14/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Cartography

enum WebIndex:Int {
    case UIWebView=0, WKWebView
}

class SFWebListController: SFBaseController, UITableViewDelegate{
    //MARK:Property
    let webArray: Array<String> = ["UIWebView", "WKWebView"]
    let tableView: UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
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
        let identifier = "menuIdentifier"
        dataSource = SFArrayDataSource(items: webArray, cellIdentifier: identifier, configureCellBlock:configureCell)
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

    //MARK:UIWebViewDelegate
    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var controller:SFBaseController?
        if let index = WebIndex(rawValue: indexPath.row) {
            switch index {
            case .UIWebView:
                return

            case .WKWebView:
                return

            }
        }
        if let myController = controller {
            controller?.title = webArray[indexPath.row]
            self.navigationController?.pushViewController(myController, animated: true)
        }
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}