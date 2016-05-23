//
//  HTTPRequest.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/17.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

enum HTTPRequestType:NSInteger{
    case None
    case Example
}

public struct HTTPRequestParameters{
    var type: HTTPRequestType
    var parameters: [String: AnyObject]?
    
    init(requestType: HTTPRequestType){
        type = requestType
    }
    
}

class HTTPRequest:NSObject{
    
   private static let HTTPCacheTimeStampKey = "com.alamofire.cacheTimeStampKey"
    var requestParams: HTTPRequestParameters
    var dataProcess: HTTPDataProcess
    
    init(requestParams: HTTPRequestParameters) {
        self.requestParams = requestParams
        self.dataProcess = HTTPDataProcess(requestParams:requestParams)
    }

    func loadCacheData() -> AnyObject?{
        return self.dataProcess.loadCacheData()
    }
}

extension HTTPRequest{
    
    // 根据业务处理接口参数, 通过闭包返回
    var httpRequestParameters:(method:HTTPRequestManager.Method, urlString: String, params : [String : AnyObject]?){
        return (method, URLString, parameters)
    }
    
    var method: HTTPRequestManager.Method{
        switch requestParams.type {
        case .Example:
            return HTTPRequestManager.Method.GET
        default:
            return HTTPRequestManager.Method.GET
        }
    }
    
    var URLString: String{
        switch requestParams.type {
        case .Example:
            return "http://httpbin.org/get"
        default:
            return ""
        }
    }
    
    var parameters: [String: AnyObject]? {
        return requestParams.parameters
    }
    
    /// 计算 request id, 用来表示当前request类型
    var cacheIdentifier: String? {
        switch requestParams.type {
        case .Example:
            return "http://httpbin.org/get"
        default:
            return nil
        }
    }
    /// 读取缓存到期时间, 更新缓存时间
    var cacheOverdueTimeInterval: NSTimeInterval? {
        get {
            guard cacheIdentifier != nil else{
                return nil;
            }
            
            if let dic = NSUserDefaults.standardUserDefaults().objectForKey(HTTPRequest.HTTPCacheTimeStampKey), timestamp = dic[cacheIdentifier!] as? NSNumber{
                return timestamp.doubleValue
            }
            return nil
        }
        set {
            guard cacheIdentifier != nil else{
                return
            }
            guard newValue != nil else {
                return
            }
            
            var dic = NSUserDefaults.standardUserDefaults().dictionaryForKey(HTTPRequest.HTTPCacheTimeStampKey)
            if dic == nil {
                dic = [String: NSNumber]()
            }
            
            dic![cacheIdentifier!] = NSNumber(double: newValue!)
            NSUserDefaults.standardUserDefaults().setObject(dic, forKey: HTTPRequest.HTTPCacheTimeStampKey)
        }
    }
}





























