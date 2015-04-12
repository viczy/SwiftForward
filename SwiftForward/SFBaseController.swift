//
//  SFBaseController.swift
//  SwiftForward
//  关于init的一些意见：http://swifter.tips/init-keywords/
//  Created by Vic Zhou on 3/13/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import UIKit

class SFBaseController: UIViewController {

    //MARK:Init
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(aTitle:String) {
        self.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
