//
//  SFSearchController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/20/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Cartography

class SFSearchController: SFBaseController, UISearchControllerDelegate, UISearchResultsUpdating {
    let tableView: UITableView = UITableView(frame: CGRectZero, style: UITableViewStyle.Plain)
    let searchController = UISearchController(searchResultsController: nil)
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
        view.backgroundColor = UIColor.whiteColor()
        super.viewDidLoad()
    }

    //MARK:SetUP View
    private func setUpView() {
        //tableView
        let identifier = "searchSourceCellIdentifier"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        layout(tableView) { view in
            view.edges == inset(view.superview!.edges, 0, 0, 0, 0); return
        }
        //searchController
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.frame.size.height = 44.0
        tableView.tableHeaderView = searchController.searchBar
        self.definesPresentationContext = true
    }

    //MARK:UISearchControllerDelegate

    //MARK:UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        //
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}