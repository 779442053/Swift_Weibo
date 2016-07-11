//
//  CYNetworkManager.swift
//  SinaWeibo-Swift
//
//  Created by 董招兵 on 16/7/11.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

import UIKit
import AFNetworking
class CYNetworkManager: AFHTTPSessionManager {

    static let shareManager:CYNetworkManager = {
    
        // 注意: 指定BaseURL时一定要包含/
        let url = NSURL(string: "https://api.weibo.com/")
        let instance = CYNetworkManager(baseURL: url, sessionConfiguration: NSURLSessionConfiguration.defaultSessionConfiguration())
        instance.responseSerializer.acceptableContentTypes = (NSSet(objects: "application/json", "text/json", "text/javascript", "text/plain") as! Set<String>);
        return instance
        
    }()
    
    class func postReqeust(path:String,params:AnyObject?,callBack:(result : [String : AnyObject]?)->(),failureBlock : (error:NSError?)->()) {
    
    let netWorkManager = CYNetworkManager.shareManager;
    let url : String   = (netWorkManager.baseURL?.absoluteString)! + path;

     netWorkManager.POST(url, parameters: params, progress: nil, success: { (task, returnData) -> Void in
        
        
        let dict : Dictionary = returnData as! [String : AnyObject];
        callBack(result: dict);
            }) { (task, error) -> Void in
                
                failureBlock(error: error);
                
        }
        
        
    }
    
}
