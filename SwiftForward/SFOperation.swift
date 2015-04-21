//
//  SFOperation.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/10/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFOperation: NSOperation {
    var action: ()->Void
    var queue = NSOperationQueue()

    init(action anAction:()->Void) {
        action = anAction
        super.init()
    }

    override func main() {
        super.main()

        var o1 = NSBlockOperation {
            println("current thread------\(NSThread.currentThread()) and tiem------\(NSDate())")
        }

        var o2 = NSBlockOperation {
            println("current thread------\(NSThread.currentThread()) and tiem------\(NSDate())")
        }

        var o3 = NSBlockOperation {
            println("current thread------\(NSThread.currentThread()) and tiem------\(NSDate())")
        }
        queue.maxConcurrentOperationCount = 1
        queue.addOperation(o1)
        queue.addOperation(o2)
        queue.addOperation(o3)
    }

    override func start() {
        super.start()
        //
    }

    override func cancel() {
         super.cancel()
        //
    }
}