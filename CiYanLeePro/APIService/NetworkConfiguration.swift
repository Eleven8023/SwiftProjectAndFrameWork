//
//  NetworkConfiguration.swift
//  CiYanLeePro
//
//  Created by leo on 16/5/16.
//  Copyright © 2016年 leo. All rights reserved.
//

import Foundation
import UIKit
// MARK:--配置环境基地址
public enum HTTPRequestEnvironmentType:NSInteger{
    case EnumAppEnvironmentDevelop
    case EnumAppEnvironmentTest
    case EnumAppEnvironmentProduction
}
public let KAppEnvironment = HTTPRequestEnvironmentType.EnumAppEnvironmentDevelop
public let EnumAppEnvironmentDev:String = ""
public let EnumAppEnvironmentTest:String = ""
public let EnumAppEnvironmentProduct:String = ""













