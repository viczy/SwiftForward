//
//  SFTopicUpdateController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/13/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFTopicUpdateController: SFBaseController {
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
        //
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}