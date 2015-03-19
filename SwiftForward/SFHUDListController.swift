//
//  SFHUDController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/19/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Cartography
import SVProgressHUD

enum HUDIndex:Int {
    case Normal = 0, Progress, Success
}

class SFHUDListController: SFBaseController, UITableViewDelegate {
    //MARK:Property
    private var menuArray: NSArray!
    private var arrayDataSource: SFArrayDataSource!

    private var tableView: UITableView!
    private var dimissButtonItem: UIBarButtonItem!

    //MARK:Init
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    //MARK:Load&Appear
    override func loadView() {
        self.propertyInit()
        super.loadView()
        navigationItem.rightBarButtonItem = dimissButtonItem
        tableViewLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:Property Init
    private func propertyInit() {
        //menuArray
        menuArray = ["Normal", "Progress", "Success"]

        //tableView
        tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
        var configureBlock:CellConfigureBlock = configureCell
        let identifier = "refreshListIdentifier"
        arrayDataSource = SFArrayDataSource(items: menuArray, cellIdentifier: identifier, configureCellBlock: configureBlock)
        tableView.dataSource = arrayDataSource
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)

        //dimissButtonItem
        dimissButtonItem = UIBarButtonItem(title: "dismiss", style: UIBarButtonItemStyle.Done, target: self, action:"dismissHUD")
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

    private func dismissHUD() {
        SVProgressHUD.popActivity()
    }

    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var controller:SFBaseController?
        if let index = HUDIndex(rawValue: indexPath.row) {
            switch index {
            case .Normal:
                SVProgressHUD.show()

            case .Progress:
                return

            case .Success:
                SVProgressHUD.showSuccessWithStatus("SUCCESS")
                
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
