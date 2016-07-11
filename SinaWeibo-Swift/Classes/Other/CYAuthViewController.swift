//
//  CYAuthViewController.swift
//  SinaWeibo-Swift
//
//  Created by 董招兵 on 16/7/11.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

import UIKit

class CYAuthViewController: UIViewController {

    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        let str = "https://api.weibo.com/oauth2/authorize?client_id=\(WB_App_Key)&redirect_uri=\(WB_Redirect_URI)"
        
        let url : NSURL? = NSURL(string: str);
        let request: NSURLRequest? = NSURLRequest(URL: url!)
        webView.loadRequest((request)!)
        
    
    }

   

}


extension CYAuthViewController : UIWebViewDelegate {
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        
        
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let urlString :String = (request.URL?.absoluteString)!;

        if ((urlString as NSString).rangeOfString("code=").length>0) {
            if let code = (urlString as NSString).componentsSeparatedByString("code=").last {
                
                let parameters = ["client_id": WB_App_Key, "client_secret": WB_App_Secret, "grant_type": "authorization_code", "code": code, "redirect_uri": WB_Redirect_URI]
                
                CYNetworkManager.postReqeust("oauth2/access_token", params: parameters, callBack: { (result) -> () in
                  
                    let userAccount = UserAccount(dict: result);
                
                     userAccount.saveUserAccount();
                    
                    AppDelegate.appDelegate().selectViewController();
                    
                    }, failureBlock: { (error) -> () in
                        
                        
                });
                
                
                return false;
            };
            
        }
        
        print(request.URL?.absoluteString);
        
        return true
    }
    
    
}
