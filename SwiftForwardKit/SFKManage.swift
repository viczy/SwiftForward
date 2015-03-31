//
//  SFKManage.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/31/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

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
    func storeMenu() {

    }
}