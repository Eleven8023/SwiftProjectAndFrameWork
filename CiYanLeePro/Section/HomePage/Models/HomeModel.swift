//
//  HomeModel.swift
//  CiYanLeePro
//
//  Created by Eleven on 16/6/2.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomeModel: NSObject {
    var image_list:String?
    var theme_name:String?
    var sub_number:Int?
    var is_default:Int?
    var is_sub:Int?
    var theme_id:Int?
   
    class func loadHomePageData(array:NSMutableArray) -> [HomeModel] {
        var home = [HomeModel]()
        for dic in array {
            home.append(HomeModel.homeMode(dic as! NSDictionary))
        }
        return home
    }
    
    class func homeMode(dic:NSDictionary) -> HomeModel {
        let model = HomeModel()
        model.image_list = dic["image_list"] as? String
        model.theme_name = dic["theme_name"] as? String
        model.sub_number = dic["sub_number"] as? Int
        model.is_default = dic["is_default"] as? Int
        model.is_sub = dic["is_sub"] as? Int
        model.theme_id = dic["theme_id"] as? Int
        return model
    }
    
}
