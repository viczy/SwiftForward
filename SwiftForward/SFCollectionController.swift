//
//  SFCollectionController.swift
//  SwiftForward
//
//  Created by Vic Zhou on 3/26/15.
//  Copyright (c) 2015 everycode. All rights reserved.
//

import Foundation

class SFCollectionController: SFBaseController {
    let collectionView:UICollectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())

    //MARK:Init
    override init() {
        super.init()
    }

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

    //MARK:setUpView
    func setUpView() {
        //
    }

}