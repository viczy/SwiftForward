//
//  ViewController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/11/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Cartography

enum MenuIndex:Int {
    case Refresh = 0, HUD, Alamofire, Realm, CollectionView
}

class SFMenuController: SFBaseController, UITableViewDelegate {
    //MARK:Property
    let menuArray = ["Refresh", "HUD", "Alamofire", "Realm", "CollectionView"]
    let tableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    private var dataSource:SFArrayDataSource?

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

    convenience init(abc: String) {
        self.init(nibName: nil, bundle: nil)

    }

    //MARK:Load&Appear
    override func loadView() {
        super.loadView()
        self.setUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //sfkmanager
//        let menuDic = ["title":"menu"]
//        let menu = SFKManager.Router.menu.translate(attribute: menuDic)
//        if let myMenu = menu {
//            SFKManager.store(object: myMenu)
//        }

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
        if let index = MenuIndex(rawValue: indexPath.row) {
            switch index {
            case .Refresh:
                controller = SFRefreshListController()

            case .HUD:
                controller = SFHUDListController()

            case .Alamofire:
                return
                
            case .Realm:
                return

            case .CollectionView:
                controller = SFCollectionController()

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

