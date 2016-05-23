//
//  MainTabBarViewController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/20.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class MainTabBarViewController: AnimationTabBarViewController, UITabBarControllerDelegate {

    private var fristLoadMainTabBarController:Bool = true
    private var adImageView: UIImageView?
    var adImage: UIImage? {
        didSet {
            weak var tmpSelf = self
            adImageView = UIImageView(frame: ScreenBounds)
            adImageView!.image = adImage
            self.view.addSubview(adImageView!)
            
            UIImageView.animateWithDuration(2.0, animations: { () -> Void in
                tmpSelf!.adImageView!.transform = CGAffineTransformMakeScale(1.2, 1.2)
                tmpSelf!.adImageView!.alpha = 0
                }) { (finish) -> Void in
                    tmpSelf!.adImageView!.removeFromSuperview()
                    tmpSelf!.adImageView = nil
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        buildMainTabBarChildViewController()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if fristLoadMainTabBarController {
            let containers = createViewContainers()
            createCustomIcons(containers)
            fristLoadMainTabBarController = false
        }
        
    }
    
// MARK: - Method
     // MARK: 初始化tabbar
    private func buildMainTabBarChildViewController() {
        
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
