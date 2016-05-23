//
//  BaseNavigationVController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/18.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class BaseNavigationVController: UINavigationController {

    var isAnimation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer!.delegate = nil
        
        // Do any additional setup after loading the view.
    }
    
    lazy var backBtn: UIButton = {
        // 设置返回按钮属性
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.setImage(UIImage(named: "v2_goback"), forState: .Normal)
        backBtn.titleLabel?.hidden = true
        backBtn.addTarget(self, action: #selector(BaseNavigationVController.backBtnClick), forControlEvents: .TouchUpInside)
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        let btnW: CGFloat = ScreenWidth > 375.0 ? 50 : 44
        backBtn.frame = CGRectMake(0, 0, btnW, 40)
        return backBtn
    }()
    

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.hidesBackButton = true
        if childViewControllers.count > 0 {
        
            UINavigationBar.appearance().backItem?.hidesBackButton = false
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView:backBtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backBtnClick() {
        popViewControllerAnimated(isAnimation)
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
