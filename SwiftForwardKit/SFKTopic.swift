//
//  SFKTopic.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/14/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFKTopic: SFKBaseObject  {
    dynamic var cover:String = ""
    dynamic var title:String = ""
    dynamic var content:String = ""

    override func translateWithAttribute(attribute anAttribute:Dictionary<String, AnyObject>) {
        super.translateWithAttribute(attribute: anAttribute)

        let coverOp = anAttribute["cover"] as? String
        if let myCover = coverOp {
            cover = myCover
        }

        let titleOp = anAttribute["title"] as? String
        if let myTitle = titleOp {
            title = myTitle
        }

        let contentOp = anAttribute["content"] as? String
        if let myContent = contentOp {
            content = myContent
        }
    }
}