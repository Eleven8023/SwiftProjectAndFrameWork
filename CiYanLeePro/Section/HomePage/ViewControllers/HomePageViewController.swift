//
//  HomePageViewController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/23.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomePageViewController: HomePageTitleViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://api.budejie.com/api/api_open.php?a=tag_recommend&c=topic&action=sub", parameters: nil, encoding: .URL, headers: nil).responseJSON { (
            resp) in
            if let error = resp.result.error{
                print(error)
            }else if let value = resp.result.value{
                print(value)
                let home = HomeModel.loadHomePageData(value as! NSMutableArray)
                print(home[0].theme_name)
            }
        }
        
        
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
