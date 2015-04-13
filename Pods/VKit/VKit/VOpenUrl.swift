//
//  VOpenUrl.swift
//  VKit_Example
//
//  Created by Vic Zhou on 11/20/14.
//  Copyright (c) 2014 everycode. All rights reserved.
//

import UIKit

public class VOpenUrl: NSObject {

/**
* @brief Application跳转
*
* Detailed
* @param[in]  AnyObject
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openAnyObject(anyobject:AnyObject) {
        if let url = anyobject as? NSURL {
            UIApplication.sharedApplication().openURL(url)
            return
        }

        if let path = anyobject as? NSString {
            var encodePath = path.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            var url = NSURL(string: encodePath!)
            UIApplication.sharedApplication().openURL(url!)
            return
        }

        println("VOpenUrl openAnyObject error")
    }


/**
* @brief 跳转到苹果市场该app的详情页
*
* Detailed
* @param[in]  App的id
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openAppStoreHomepage(appid:NSInteger) {
        var path = NSString(format: "itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%u", appid)
        self.openAnyObject(path)
    }

/**
* @brief 跳转到苹果市场该app的评论页
*
* Detailed
* @param[in]  App的id
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openAppStoreCommentPage(appid:NSInteger) {
        var path = NSString(format: "itms-apps://phobos.apple.com/WebObjects/MZStore.woa/wa/viewSoftware?id=%u", appid)
        self.openAnyObject(path)
    }


/**
* @brief 打开系统浏览器
*
* Detailed
* @param[in]  链接地址
* @param[out] N/A
* @return  N/A
* @note
*/
    public class func openBrowser(link:NSString) {
        self.openAnyObject(link)
    }


/**
* @brief 打开系统电话
*
* Detailed
* @param[in]  拨号号码
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openPhone(phonenumber:NSString) {
        var phonePath = NSString(format: "tel://%@", phonenumber)
        self.openAnyObject(phonePath)
    }


/**
* @brief 打开系统短信
*
* Detailed
* @param[in]  电话号码
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openSMS(phonenumber:NSString) {
        var smsPath = NSString(format: "sms://%@", phonenumber)
        self.openAnyObject(smsPath)
    }


/**
* @brief 打开系统邮箱
*
* Detailed
* @param[in]  邮箱地址
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openEmail(email:NSString) {
        var emailPath = NSString(format: "mailto://%@", email)
        self.openAnyObject(emailPath)
    }


/**
* @brief 打开google地图
*
* Detailed
* @param[in]  地址
* @param[out] N/A
* @return  N/A
* @note
*/

    public class func openGoogleMap(address:NSString) {
        var mapPath = NSString(format: "http://maps.google.com/maps?q=%@", address)
        self.openAnyObject(mapPath)
    }

}