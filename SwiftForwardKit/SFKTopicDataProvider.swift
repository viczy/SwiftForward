//
//  SFTopicDataProvider.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/15/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Alamofire

struct SFKTopicDataProvider {
    enum Route: URLRequestConvertible {

        case Topics(Int)
        case TopicCompose(String, String)
        case TopicDelete(Int)

        var method: Alamofire.Method {
            switch self {
            case .TopicCompose:
                return .POST

            case .TopicDelete:
                return .DELETE

            default: return .GET
            }
        }

        var path: String {
            switch self {
            case .Topics (let page):
                return "/topics"

            case .TopicCompose:
                return "/topics"

            case .TopicDelete(let topicID):
                return "/topics/\(topicID)"
            }
        }

        var URLRequest: NSURLRequest {
            let (encoding: ParameterEncoding?, params:[String: AnyObject]?, encodEnable:Bool) = {
                switch self {
                case .TopicCompose(let title, let content):
                    let params = ["title": title, "content": content]
                    return(Alamofire.ParameterEncoding.JSON, params, true)//or Alamofire.ParameterEncoding.URL

                default: return(nil, nil, false)
                }
            }()

            let URL = NSURL(string: SFKDomain.domain)
            let mutableURLRequest = NSMutableURLRequest(URL: URL!.URLByAppendingPathComponent(path))
            mutableURLRequest.HTTPMethod = method.rawValue
            if encodEnable {
                if let myEncoding = encoding {
                   return myEncoding.encode(mutableURLRequest, parameters: params).0
                }
            }
            return mutableURLRequest
        }
    }

   static func fetchTopics(aPage:Int) {
        Alamofire.request(SFKTopicDataProvider.Route.Topics(1)).validate().responseJSON { (_, _, json, _) -> Void in
            SFKManager.saveTopics(json)
        }
    }
    
}
