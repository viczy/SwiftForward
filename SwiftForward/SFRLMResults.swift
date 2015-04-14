//
//  SFRLMResults.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/14/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Realm

extension RLMResults {
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for i in 0...self.count-1 {
            var result: AnyObject! = self[i]
            if let result = result as? T {
                array.append(result)
            }
        }
        return array
    }
}

