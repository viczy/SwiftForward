//
//  SFKManage.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/31/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Realm
import Alamofire
import SwiftyJSON

struct SFKManager {
    enum Router {
        case menu
        case refresh
        case topic

        func translate(attribute anAttribute:Dictionary<String, AnyObject>) -> SFKBaseObject? {
            switch self {
            case .menu:
                let menuObject = SFKMenu()
                menuObject.translateWithAttribute(attribute: anAttribute)
                return menuObject

            case .refresh:
                return nil

            case .topic:
                let topicObject = SFKTopic()
                topicObject.translateWithAttribute(attribute: anAttribute)
                return topicObject
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

extension SFKManager {
    static func saveTopics(data:AnyObject?) {
        if let myData: AnyObject = data {
            let json = JSON(myData)
            var topics = json.arrayObject
            if let myTopics = topics {

                let realm = RLMRealm.defaultRealm()
                realm.beginWriteTransaction()

                for topic in myTopics {
                    var topicObject = self.Router.topic.translate(attribute: topic as! Dictionary)
                    SFKTopic.createOrUpdateInRealm(realm, withObject: topicObject)
                }
                
                realm.commitWriteTransaction()
            }
        }
    }
}