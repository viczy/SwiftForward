//
//  SFCollectionLayout.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/30/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFCollectionLayout: UICollectionViewFlowLayout {

    //MARK:Init
    override init() {
        super.init()
        sectionInset = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        scrollDirection = UICollectionViewScrollDirection.Vertical
        minimumLineSpacing = 20
        minimumInteritemSpacing = 20
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK:CollectionLayout
    override func prepareLayout() {
        super.prepareLayout()

    }

    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var layoutAttributes:Array<UICollectionViewLayoutAttributes> = []
        let count = collectionView?.numberOfItemsInSection(0)
        for i in 1...15{
            let indexPath = NSIndexPath(forRow: i, inSection: 0)
            let layoutAttribute = self.layoutAttributesForItemAtIndexPath(indexPath)
            layoutAttributes.append(layoutAttribute)
        }
        return layoutAttributes
    }

    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        let layoutAttribute = UICollectionViewLayoutAttributes(forCellWithIndexPath:indexPath)
        layoutAttribute.size.width = 50.0
        layoutAttribute.size.height = CGFloat(indexPath.row)+50.0
        layoutAttribute.center.x = CGFloat(indexPath.row%5)*50.0+50.0
        layoutAttribute.center.y = CGFloat(indexPath.row/5)*50.0+200.0

        return layoutAttribute
    }
}