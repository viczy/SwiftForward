//
//  VImage.swift
//  VKit_Example
//
//  Created by Vic Zhou on 1/29/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import UIKit

public extension UIImage {

/**
* @brief
* 图片等比缩放
* Detailed
* @param[in] 容器的size
* @param[out] N/A
* @return clipped-image
* @note
*/
    public func imageZoom(size:CGSize) -> UIImage {
        var imageSize:CGSize = self.size
        var contrainerRect: CGRect
        if (imageSize.width <= size.width) {//width longer
            if (imageSize.height <= size.height) {//height longer
                return self;
            }else {
                contrainerRect = CGRectMake(0.0, (imageSize.height-size.height)/2, size.width, size.height);
            }
        }else {
            if (imageSize.height <= size.height) {
                contrainerRect = CGRectMake((imageSize.width-size.width)/2, 0.0, size.width, size.height);
            }else {
                contrainerRect = CGRectMake((imageSize.width-size.width)/2, (imageSize.height-size.height)/2, size.width, size.height);
            }
        }
        var imageRef:CGImageRef = self.CGImage
        var zoomImageRef:CGImageRef = CGImageCreateWithImageInRect(imageRef, contrainerRect)
        var zoomImage:UIImage = UIImage(CGImage: zoomImageRef)!
        return zoomImage
    }

}