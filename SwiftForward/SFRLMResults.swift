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
        for i in 1...self.count {
            var result: AnyObject! = self[(i-1)]
            if let result = result as? T {
                array.append(result)
            }
        }
        return array
    }
}

