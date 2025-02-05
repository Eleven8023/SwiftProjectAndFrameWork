//
//  AnimationTabBarViewController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/15.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit


class RAMBounceAnimation: RAMItemAnimation {
    override func playAnimation(icon: UIImageView, textLabel: UILabel) {
        playBounceAnimation(icon)
        textLabel.textColor = textSelectedColor
    }
    
    override func deselectAnimation(icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor) {
        textLabel.textColor = defaultTextColor
        
        if let iconImage = icon.image{
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = defaultTextColor
        }
    }
    
    override func selectedState(icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = textSelectedColor
        
        if let iconImage = icon.image{
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = textSelectedColor
        }
    }
    
    func playBounceAnimation(icon:UIImageView){
        
        let bounceAnimation = CAKeyframeAnimation(keyPath:"transform.scale")
        bounceAnimation.values = [1.0, 1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
        bounceAnimation.duration = NSTimeInterval(duration)
        bounceAnimation.calculationMode = kCAAnimationCubic
        
        icon.layer.addAnimation(bounceAnimation, forKey: "bounceAnimation")
        
        if let iconImage = icon.image{
            let renderImage = iconImage.imageWithRenderingMode(.AlwaysOriginal)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }
}



class RAMAnimatedTabBarItem: UITabBarItem {
    var animation: RAMItemAnimation?
    
    var textColor = UIColor.grayColor()
    
    func playAnimation(icon: UIImageView, textLabel:UILabel){
        guard let animation = animation else{
            print("add animation in UITabBarItem")
            return
        }
        animation.playAnimation(icon, textLabel: textLabel)
    }
    
    func deselectAnimation(icon:UIImageView, textLabel:UILabel){
        animation?.deselectAnimation(icon, textLabel: textLabel, defaultTextColor: textColor)
    }
    
    func selectedState(icon:UIImageView, textLabel:UILabel){
        animation?.selectedState(icon, textLabel: textLabel)
    }
    
}

protocol RAMItemAnimationProtocol {
    func playAnimation(icon : UIImageView, textLabel: UILabel)
    func deselectAnimation(icon : UIImageView, textLabel : UILabel, defaultTextColor : UIColor)
    func selectedState(icon : UIImageView, textLabel : UILabel)
}

class RAMItemAnimation: NSObject, RAMItemAnimationProtocol {
    var duration : CGFloat = 0.6
    var textSelectedColor: UIColor = UIColor.grayColor()
    var iconSelectedColor: UIColor?
    
    func playAnimation(icon : UIImageView, textLabel : UILabel){
    }
    func deselectAnimation(icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor) {
    }
    func selectedState(icon: UIImageView, textLabel: UILabel) {
    }
    
}

class AnimationTabBarViewController: UITabBarController {

    var iconsView:[(icon: UIImageView, textLabel:UILabel)] = []
    var iconsImageName:[String] = ["v2_home","v2_order","shopCart","v2_my"]
    var iconsSelectedImageName:[String] = ["v2_home_r","v2_order_r","shopCart_r","v2_my_r"]
    var shopCarIcon: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AnimationTabBarViewController.searchViewControllerDeinit), name: "LFBSearchViewControllerDeinit", object: nil)
        // Do any additional setup after loading the view.
    }

    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func searchViewControllerDeinit() {
        if shopCarIcon != nil{
            let redDotView = ShopCarRedDotView.sharedRedDotView
            redDotView.frame = CGRectMake(22, -3, 15, 15)
            shopCarIcon?.addSubview(redDotView)
        }
    }
    
    func createViewContainers() -> [String:UIView] {
        var containersDict = [String: UIView]()
        
        guard let customItems = tabBar.items as? [RAMAnimatedTabBarItem] else{
            return containersDict
        }
        
        for index in 0..<customItems.count{
            let viewContainer =  createViewContainer(index)
            containersDict["container\(index)"] = viewContainer
        }
        return containersDict
    }
    
    func createViewContainer(index: Int) -> UIView{
        
        let viewWidth: CGFloat = ScreenWidth / CGFloat(tabBar.items!.count)
        let viewHeight:CGFloat = tabBar.bounds.size.height
        
        let viewContainer = UIView(frame: CGRectMake(viewWidth * CGFloat(index), 0, viewWidth, viewHeight))
        
        viewContainer.backgroundColor = UIColor.clearColor()
        viewContainer.userInteractionEnabled = true
        
        tabBar.addSubview(viewContainer)
        viewContainer.tag = index
        
        let tap = UITapGestureRecognizer(target: self, action: Selector("tabBarClick"))
        viewContainer.addGestureRecognizer(tap)
        
        return viewContainer
    }
    
    func createCustomIcons(containers: [String: UIView]){
        
        if let items = tabBar.items{
            
            for (index, item) in items.enumerate() {
               
                assert(item.image != nil, "add image icon in UITabBarItem")
                
                guard let container = containers["container\(index)"] else
                {
                    print("No container given")
                    continue
                }
                
                container.tag = index
                
                let imageW:CGFloat = 21
                let imageX:CGFloat = (ScreenWidth / CGFloat(items.count) - imageW) * 0.5
                let imageY:CGFloat = 8
                let imageH:CGFloat = 21
                let icon = UIImageView(frame: CGRect(x: imageX, y: imageY, width: imageW, height: imageH))
                icon.image = item.image
                icon.tintColor = UIColor.clearColor()
                
                // text
                let textLabel = UILabel()
                textLabel.frame = CGRectMake(0, 32, ScreenWidth / CGFloat(items.count), 49 - 32)
                textLabel.text = item.title
                textLabel.backgroundColor = UIColor.clearColor()
                textLabel.font = UIFont.systemFontOfSize(10)
                textLabel.textAlignment = NSTextAlignment.Center
                textLabel.translatesAutoresizingMaskIntoConstraints = false
                container.addSubview(icon)
                container.addSubview(textLabel)
                
                if let tabBarItem = tabBar.items{
                    let textLabelWidth = tabBar.frame.size.width / CGFloat(tabBarItem.count)
                    textLabel.bounds.size.width = textLabelWidth
                }
                
                if 2 == index{
                    let redDotView = ShopCarRedDotView.sharedRedDotView
                    redDotView.frame = CGRectMake(imageH + 1, -3, 15, 15)
                    icon.addSubview(redDotView)
                    shopCarIcon = icon
                }
                
                let iconsAndLabels = (icon:icon, textLabel:textLabel)
                iconsView.append(iconsAndLabels)
                
                item.image = nil
                item.title = ""
                
                if index == 0 {
                    selectedIndex = 0
                    selectItem(0)
                }
            }
        }
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
     
        setSelectIndex(from: selectedIndex, to: item.tag)
    }
    
    func selectItem(index:Int){
        let items = tabBar.items as! [RAMAnimatedTabBarItem]
        let selectIcon = iconsView[index].icon
        selectIcon.image = UIImage(named: iconsSelectedImageName[index])
        items[index].selectedState(selectIcon, textLabel: iconsView[index].textLabel)
    }
    
    func setSelectIndex(from from:Int, to: Int) {
        if to == 2{
            let vc = childViewControllers[selectedIndex]
            let shopCar = ShopCartViewController()
            let nav = BaseNavigationVController(rootViewController:shopCar)
            vc.presentViewController(nav, animated: true, completion: nil)
            return
        }
        
        selectedIndex = to
        let items = tabBar.items as! [RAMAnimatedTabBarItem]
        
        let formIV = iconsView[from].icon
        formIV.image = UIImage(named: iconsImageName[from])
        items[from].deselectAnimation(formIV, textLabel: iconsView[from].textLabel)
        
        let toIV = iconsView[to].icon
        toIV.image = UIImage(named: iconsSelectedImageName[to])
        items[to].playAnimation(toIV, textLabel: iconsView[to].textLabel)
        
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
