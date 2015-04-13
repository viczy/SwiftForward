//
//  VString.swift
//  VKit_Example
//
//  Created by Vic Zhou on 11/10/14.
//  Copyright (c) 2014 everycode. All rights reserved.
//

import Foundation

extension String {

/**
* @brief
* 配置：buile settings/Objective-c bridging header/ +($(SRCROOT)/VKit/vkit-Bridging-Header.h)
    #import <CommonCrypto/CommonCrypto.h>
* Detailed
* @param[in]
* @param[out] N/A
* @return
* @note
*/
     /*please copy to you file
    func md5() -> String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)

        CC_MD5(str!, strLen, result)

        var hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }

        result.destroy()
        
        return String(format: hash as String)
    }
    */

/**
* @brief 字符串中特殊符号的处理
*
* Detailed
* @param[in]  含有特殊符号的字符串
* @param[out] N/A
* @return  处理好特殊字符的字符串
* @note
*/

//    func specialCharTransform() -> String? {
//
//    }

}
