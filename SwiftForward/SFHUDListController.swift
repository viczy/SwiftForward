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
    let hudArray: Array<String> = ["Normal", "Progress", "Success"]
    let dismissButtonItem: UIBarButtonItem = UIBarButtonItem(title: "dismiss", style: UIBarButtonItemStyle.Done, target: nil, action: "dismissHUD")
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
        //tableView
        let identifier = "hudListIdentifier"
        dataSource = SFArrayDataSource(items: hudArray, cellIdentifier: identifier, configureCellBlock: configureCell)
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        layout(tableView) { view in
            view.edges == inset(view.superview!.edges, 0, 0, 0, 0); return
        }
        //rightbarbuttonitem
        dismissButtonItem.target = self
        self.navigationItem.rightBarButtonItem = dismissButtonItem
    }

    func configureCell(aCell:UITableViewCell, aItem:AnyObject) {
        aCell.textLabel?.text = aItem as? String
    }

    func dismissHUD() {
        SVProgressHUD.dismiss()
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
