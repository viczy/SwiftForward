//
//  SFTopicListCell.swift
//  SwiftForward
//
//  Created by Vic Zhou on 4/14/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Cartography


class SFTopicListCell: UITableViewCell {
    private lazy var contrainerView:UIView = {
        var view = UIView(frame: CGRectZero)
        return view
    }()

    lazy var coverImageView:UIImageView = {
        var imageView = UIImageView(frame: CGRectZero)

        let url = NSURL(string: "http://img.bz1111.com/d3/2009-5/200905120037292250.jpg")
        imageView.sd_setImageWithURL(url)

        return imageView
    }()

    lazy var titleLabel:UILabel = {
        var label = UILabel(frame: CGRectZero)
        label.numberOfLines = 1
        label.textColor = UIColor.darkGrayColor()

        label.text = "这是个感人的话题"

        return label
    }()

    lazy var contentLabel:UILabel = {
        var label = UILabel(frame: CGRectZero)
        label.numberOfLines = 3
        label.textColor = UIColor.lightGrayColor()

        label.text = "感人话题不是个好的话题，整整的话题还有很古董值得理解的东西。慢慢发现你自己的东西，你就会找个整整的话题，难得有让你感兴趣的东西，所以要用心去发现，去发掘，去获取。"

        return label
    }()

    //MARK:Init
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    //MARK:Draw
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.addSubview(contrainerView)
        layout(contrainerView) { view in
            view.edges == inset(view.superview!.edges, 5, 5, 5, 5)
        }
        contrainerView.addSubview(coverImageView)
        contrainerView.addSubview(titleLabel)
        contrainerView.addSubview(contentLabel)
        layout(coverImageView, titleLabel, contentLabel) { cover, title, content in
            cover.width == 60
            cover.height == 60
            cover.left == cover.superview!.left
            cover.top == cover.superview!.top

            title.height == 21
            title.top == title.superview!.top
            title.left == cover.right+5
            title.right == title.superview!.right

            content.height == 63
            content.left == title.left
            content.right == title.right
            content.bottom == content.superview!.bottom
        }
    }
}
