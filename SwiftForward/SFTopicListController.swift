//
//  SFTopicListController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/13/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Cartography
import Realm

class SFTopicListController: SFBaseController, UITableViewDelegate {
    //MARK:Property
    let realm = RLMRealm.defaultRealm()
    var topicArray = SFKTopic.allObjects().toArray(SFKTopic.self)
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
        let token = realm.addNotificationBlock {[unowned self] note, realm  in
            self.tableView.reloadData()
        }
//        SFKManager.fetchTopics()
        SFKTopicDataProvider.fetchTopics(1)
    }

    //MARK:SetUP View
    private func setUpView() {
        let identifier = "topicListIdentifier"
        dataSource = SFArrayDataSource(items: topicArray, cellIdentifier: identifier, configureCellBlock: configureCell)
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.registerClass(SFTopicListCell.self, forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        layout(tableView) { view in
            view.edges == inset(view.superview!.edges, 0, 0, 0, 0); return
        }
    }

    func configureCell(aCell:UITableViewCell, aItem:AnyObject) {
        let cell = aCell as! SFTopicListCell
        let topic = aItem as! SFKTopic
        cell.titleLabel.text = topic.title
        cell.contentLabel.text = topic.content
    }

    //MARK:UITableViewDelegate
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}