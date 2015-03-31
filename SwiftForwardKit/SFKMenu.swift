//
//  SFKMenu.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/31/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFKMenu: SFKBaseObject {
    dynamic var title:String?
    dynamic var desc:String?

    override func translateWithAttribute(attribute anAttribute:Dictionary<String, AnyObject>) {
        super.translateWithAttribute(attribute: anAttribute)
        title = anAttribute["title"] as? String
        desc = anAttribute["desc"] as? String
    }
}
