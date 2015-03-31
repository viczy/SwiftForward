//
//  SFKMenu.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/31/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFKMenu: SFKBaseObject {
    dynamic var title:String = ""
    dynamic var desc:String = ""

    override func translateWithAttribute(attribute anAttribute:Dictionary<String, AnyObject>) {
        super.translateWithAttribute(attribute: anAttribute)
        let titleOp = anAttribute["title"] as? String
        if let myTitle = titleOp {
            title = myTitle
        }
        let descOp = anAttribute["desc"] as? String
        if let myDesc = descOp {
            desc = myDesc
        }
    }
}
