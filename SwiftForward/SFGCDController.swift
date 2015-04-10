//
//  SFGCDController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/10/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFGCDController: SFBaseController {
    let dispatchGroup = dispatch_group_create()
    let asyncQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
    let syncQueue = dispatch_queue_create("com.sf.gcd", DISPATCH_QUEUE_SERIAL)

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
        super.loadView()
        self.setUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.syncQueueGroup()
        //self.asyncQueueGroup()
        self.miscQueueGroup()
    }

    //MARK:SetUP View
    private func setUpView() {
        //
    }

    //MARK:Actions Private
    func syncQueueGroup() {
        for i in 1...5 {
            dispatch_group_async(dispatchGroup, syncQueue) {
                println("\(NSDate())---syncing\(i)")
            }
        }
        dispatch_group_notify(dispatchGroup, syncQueue) {
            println("\(NSDate())----sync done!")
        }
    }

    func asyncQueueGroup() {
        for i in 1...5 {
            dispatch_group_async(dispatchGroup, asyncQueue) {
                println("\(NSDate())---asyncing\(i)")
            }
        }
        dispatch_group_notify(dispatchGroup, asyncQueue) {
            println("\(NSDate())----async done!")
        }
    }

    func miscQueueGroup() {
        for i in 1...5 {
            dispatch_group_async(dispatchGroup, syncQueue) {
                println("\(NSDate())---fsyncing\(i)")
            }
        }
        dispatch_group_notify(dispatchGroup, syncQueue) {
            let childGroup = dispatch_group_create()
            let childQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
            for i in 1...5 {
                dispatch_group_async(childGroup, childQueue) {
                    println("\(NSDate())---casyncing\(i)")
                }
            }

            dispatch_group_notify(childGroup, childQueue) {
                println("\(NSDate())----casync done!")
            }
        }
    }

    //MARK:MemoryWarning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}