//
//  SFCollectionController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/26/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation
import Cartography

class SFCollectionController: SFBaseController {
    //MARK:Property
    let collectArray: Array<String> = ["image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image", "image"]
    let collectionView:UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: SFCollectionLayout())

    private var dataSource:SFCollectionDataSource?

    //MARK:Init
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    //MARK:Load&Appear
    override func loadView() {
        super.loadView()
        self.setUpView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK:Property Init
    private func setUpView() {
        //collectionView
        let identifier = "collectionIdentifier"
        dataSource = SFCollectionDataSource(items: collectArray, cellIdentifier: identifier, configureCellBlock: configureCell)
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = UIColor.whiteColor()
//        collectionView.delegate = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        self.view.addSubview(collectionView)
        layout(collectionView) { view in
            view.edges == inset(view.superview!.edges, 0, 0, 0, 0); return
        }
    }

    func configureCell(aCell:UICollectionViewCell, aItem:AnyObject) {
        let imageView = UIImageView(frame: aCell.bounds)
        let url = NSURL(string: "http://img.bz1111.com/d3/2009-5/200905120037292250.jpg")
        imageView.sd_setImageWithURL(url)
        aCell.backgroundView = imageView
    }

}