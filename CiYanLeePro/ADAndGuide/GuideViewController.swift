//
//  GuideViewController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/14.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {

    private var collectionView: UICollectionView?
    private var imageNames = ["guide_40_1","guide_40_2","guide_40_3","guide_40_4"]
    private var cellIdentifer = "GuideCell"
    private var isHidedenNextButton = true
    private var pageController = UIPageControl(frame: CGRectMake(0,ScreenHeight - 50, ScreenWidth, 20))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        UIApplication.sharedApplication().setStatusBarHidden(false, withAnimation: UIStatusBarAnimation.None)
        
        buildCollectionView()
        buildPageController()
        // Do any additional setup after loading the view.
    }

    // MARK:-Build UI
    private func buildCollectionView(){
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = ScreenBounds.size
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
        collectionView = UICollectionView(frame: ScreenBounds, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.pagingEnabled = true
        collectionView?.bounces = false
        collectionView?.registerClass(GuideCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifer)
        self.view.addSubview(collectionView!)
    }
    
    private func buildPageController(){
        pageController.numberOfPages = imageNames.count
        pageController.currentPage = 0
        self.view.addSubview(pageController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension GuideViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifer, forIndexPath: indexPath) as! GuideCollectionViewCell
        cell.newImage = UIImage(named: imageNames[indexPath.row])
        if indexPath.row != imageNames.count - 1 {
            cell.setNextButtonHidden(true)
        }
        return cell
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView.contentOffset.x == ScreenWidth * CGFloat(imageNames.count - 1){

            let cell = collectionView!.cellForItemAtIndexPath(NSIndexPath(forRow: imageNames.count - 1, inSection:0)) as! GuideCollectionViewCell
            cell.setNextButtonHidden(false)
            isHidedenNextButton = false
            
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if scrollView.contentOffset.x == ScreenWidth * CGFloat(imageNames.count - 1) && !isHidedenNextButton && scrollView.contentOffset.x > ScreenWidth * CGFloat(imageNames.count - 2) {
            let cell = collectionView!.cellForItemAtIndexPath(NSIndexPath(forRow: imageNames.count - 1, inSection:0)) as! GuideCollectionViewCell
            cell.setNextButtonHidden(true)
            isHidedenNextButton = true

        }
        
        pageController.currentPage = Int(scrollView.contentOffset.x / ScreenWidth + 0.5)
    }
    
}







