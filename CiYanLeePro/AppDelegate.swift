//
//  AppDelegate.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/13.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var adViewController: ADViewController?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSThread.sleepForTimeInterval(1.0)
        
        setUM()
        setKeyWindow()
        addNotification()
        setAppSubject()
        
        // Override point for customization after application launch.
        return true
    }
    // MARK:配置window
    private func setKeyWindow(){
        window = UIWindow(frame: ScreenBounds)
        window!.makeKeyWindow()
        let isFirstOpen = NSUserDefaults.standardUserDefaults().objectForKey("isFirstOpenApp")
        
        if isFirstOpen == nil {
            window?.rootViewController = GuideViewController()
            NSUserDefaults.standardUserDefaults().setObject("isFirstOpenApp", forKey: "isFirstOpenApp")
        }else{
            loadADRootViewController()
        }
    }
    
    func loadADRootViewController(){
        adViewController = ADViewController()
        weak var tmpSelf = self
        
    }

    
    func addNotification(){
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AppDelegate.showMainTabBarController), name: GuideViewControllerDidFinish, object: nil)
    }
    // MARK:- Action
    func showMainTabBarController(){
//        window!.rootViewController =
    }
    
    func setUM(){
        
    }
    
    // MARK:-Private Method
    // MARK:主题设置
    private func setAppSubject(){
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.backgroundColor = UIColor.whiteColor()
        tabBarAppearance.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        let  navBarnAppearance = UINavigationBar.appearance()
        navBarnAppearance.translucent = false
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

