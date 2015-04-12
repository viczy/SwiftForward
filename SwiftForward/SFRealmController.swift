//
//  SFRealmController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/9/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFRealmController: SFBaseController {
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

    //MARK:Realm Test
    private func addModel() {
        let menuDic = ["title":"menu"]
        let menu = SFKManager.Router.menu.translate(attribute: menuDic)
        if let myMenu = menu {
            SFKManager.store(object: myMenu)
        }
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
