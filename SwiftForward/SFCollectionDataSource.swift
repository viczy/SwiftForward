//
//  SFCollectionDataSource.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/26/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

typealias CollectionCellConfigureBlock = (UICollectionViewCell, AnyObject) -> Void

class SFCollectionDataSource: NSObject, UICollectionViewDataSource {
    //MARK:Property
    var items:Array<AnyObject>?
    var cellIdentifier:String?
    var configureCellBlock:CollectionCellConfigureBlock?

    override init() {
        super.init()
    }

    //MARK:Init
    convenience init(items anItems:Array<String>?, cellIdentifier aCellidentifier:String?, configureCellBlock aConfigureCellBlock:CollectionCellConfigureBlock?) {
        self.init();
        self.items = anItems
        self.cellIdentifier = aCellidentifier
        self.configureCellBlock = aConfigureCellBlock
    }

    //UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let myItems = items {
            return myItems.count
        }
        return 0
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier!, forIndexPath: indexPath) as? UICollectionViewCell

        if let myItems = items {
            var item:AnyObject = myItems[indexPath.row]
            if let myConfigureCellBlock = configureCellBlock {
                myConfigureCellBlock(cell!, item)
            }
        }
        return cell!
    }
    
}
