//
//  SFKBaseObject.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/31/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Realm

class SFKBaseObject: RLMObject {
    dynamic var id = 0

    func translateWithAttribute(attribute anAttribute:Dictionary<String, AnyObject>) {
        let idOp = anAttribute["id"] as? Int
        if let myId = idOp {
            id = myId as Int
        }
    }

    override class func primaryKey() -> String! {
        return "id"
    }
}


