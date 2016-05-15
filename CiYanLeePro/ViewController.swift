//
//  ViewController.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/13.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

import Alamofire
import Kingfisher
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getData(){
        
        
        
        Alamofire.request(.GET, "http://api.map.baidu.com/telematics/v3/weather?location=合肥&output=json&ak=wl82QREF9dNMEEGYu3LAGqdU", parameters: nil).validate().responseJSON { (resp) in
            
            if let error = resp.result.error{
                print(error)
            }else if let value = resp.result.value{
               print("value %@", value)
                
                }
            
            }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

