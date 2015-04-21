//
//  SFOperationQueueController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/9/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFOperationQueueController: SFBaseController {

    private let mainQueue = NSOperationQueue.mainQueue()

    private let operationBlock = NSBlockOperation { () -> Void in
        println("current thread------\(NSThread.currentThread())")
    }

    private let operationSF = SFOperation { () -> Void in
        println("current thread------\(NSThread.currentThread())")
    }

    lazy var customQueue:NSOperationQueue = {
            var custom = NSOperationQueue()
            custom.maxConcurrentOperationCount = 10
            return custom
        }()


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
//        self.mainQueueBlock()
//        self.customQueueBlock()
        self.mainQueueSF()
        self.customQueueSF()
    }

    //MARK:SetUP View
    private func setUpView() {
        //
    }

    //MARK:Actions Private
    func mainQueueBlock() {
        let operationBlock1 = NSBlockOperation { () -> Void in
            println("current thread------\(NSThread.currentThread())")
        }
        mainQueue.addOperation(operationBlock1)
    }

    func customQueueBlock() {
        customQueue.addOperation(operationBlock)
    }

    func mainQueueSF() {
        let operationSF1 = SFOperation { () -> Void in
            println("current thread------\(NSThread.currentThread())")
        }
        mainQueue.addOperation(operationSF1)
    }

    func customQueueSF() {
        customQueue.addOperation(operationSF)
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
