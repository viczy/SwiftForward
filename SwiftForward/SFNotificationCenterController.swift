//
//  SFNotificationCenterController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/9/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFNotifcationCenterController: SFBaseController {
    //MARK:Init
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "printNotification:", name: "SFNotification", object: nil)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    //MARK:Load&Appear
    override func loadView() {
        super.loadView()
        self.setUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.maintThreadPost()
        self.onceThreadPost()
        self.globalThreadPost()
        self.createSThreadPost()
        self.createCThreadPost()
    }

    //MARK:SetUP View
    private func setUpView() {
        //
    }

    //MARK:Actions Private
    func maintThreadPost() {
         NSNotificationCenter.defaultCenter().postNotificationName("SFNotification", object: nil)
    }

    func onceThreadPost() {
        var token: dispatch_once_t = 0
        dispatch_once(&token) {
            NSNotificationCenter.defaultCenter().postNotificationName("SFNotification", object: nil)
        }
    }

    func globalThreadPost() {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            NSNotificationCenter.defaultCenter().postNotificationName("SFNotification", object: nil)
        }
    }

    func createSThreadPost() {
        let queueS = dispatch_queue_create("com.sf.notification.s", DISPATCH_QUEUE_SERIAL)
        dispatch_async(queueS) {
            NSNotificationCenter.defaultCenter().postNotificationName("SFNotification", object: nil)
        }
    }

    func createCThreadPost() {
        let queueC = dispatch_queue_create("com.sf.notification.c", DISPATCH_QUEUE_CONCURRENT)
        dispatch_async(queueC) {
            NSNotificationCenter.defaultCenter().postNotificationName("SFNotification", object: nil)
        }
    }

    func printNotification(notification: NSNotification) {
        println("current thread------\(NSThread.currentThread())")
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
