//
//  Common.swift
//  SinaWeibo-Swift
//
//  Created by 董招兵 on 16/7/11.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

import Foundation


// MARK: - 授权信息
let WB_App_Key = "2680353984"//"4102358945"
let WB_App_Secret = "7f735fdcccbae8d8b44630f135888967"//"63cb5e14cf56f8c14f090ea7746f2482"
let WB_Redirect_URI = "http://www.520it.com"

/*
打印LOG的弊端:
1.非常消耗性能
2.如果app部署到AppStore之后用户是看不到LOG的

所以
开发阶段: 显示LOG
部署阶段: 隐藏LOG
*/
func NJLog<T>(message: T, fileName: String = __FILE__, methodName: String = __FUNCTION__, lineNumber: Int = __LINE__)
{
    #if DEBUG
        //    print("\((fileName as NSString).pathComponents.last!).\(methodName)[\(lineNumber)]:\(message)")
        print("\(methodName)[\(lineNumber)]:\(message)")
    #endif
}