//
//  HTTPDataProcess.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/17.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class HTTPDataProcess: NSObject {

    var requestParams: HTTPRequestParameters
    init(requestParams: HTTPRequestParameters) {
        self.requestParams = requestParams
    }
    
    func loadCacheData() -> AnyObject?{
        return nil
    }
    
    func saveData(rawData:AnyObject){
        
    }
    
}
