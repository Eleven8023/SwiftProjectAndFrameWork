//
//  HomePageTitleViewController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/20.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class HomePageTitleViewController: AnimationTabBarViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.cyanColor()
        buildNavigationItem()
        // Do any additional setup after loading the view.
    }

    // MARK: - Build UI
    private func buildNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem.barButton("扫一扫", titleColor: UIColor.blackColor(), image: UIImage(named: "icon_black_scancode")!, hightLightImage: nil, target: self, action: #selector(HomePageTitleViewController.leftItemClick), type: ItemButtonType.Left)
        navigationItem.rightBarButtonItem = UIBarButtonItem.barButton("搜索", titleColor: UIColor.blackColor(), image: UIImage(named: "icon_search")!, hightLightImage: nil, target: self, action: #selector(HomePageTitleViewController.rightItemClick), type: ItemButtonType.Right)
        navigationItem.title = "首 页"
    }
    
    func leftItemClick() {
        print("item left")
    }
    
    func rightItemClick() {
        print("item right")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
