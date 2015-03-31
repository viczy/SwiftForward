//
//  SFKManage.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/31/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Realm

struct SFKManager {
    enum Router {
        case menu
        case refresh

        func translate(attribute anAttribute:Dictionary<String, AnyObject>) -> SFKBaseObject? {
            switch self {
            case .menu:
                let menuObject = SFKMenu()
                menuObject.translateWithAttribute(attribute: anAttribute)
                return menuObject

            case .refresh:
                return nil

            default:return nil

            }
        }
    }
}

extension SFKManager {
    static func store(object anObject: SFKBaseObject) {
        let realm = RLMRealm.defaultRealm()
        realm.beginWriteTransaction()
        realm.addObject(anObject)
        realm.commitWriteTransaction()
    }
}