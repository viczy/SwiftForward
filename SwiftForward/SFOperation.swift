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

    init(action anAction:()->Void) {
        action = anAction
        super.init()
    }

    override func main() {
        super.main()
        action()
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