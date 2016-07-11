//
//  UserAccount.swift
//  SinaWeibo-Swift
//
//  Created by 董招兵 on 16/7/11.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

import UIKit

class UserAccount: NSObject,NSCoding {

    /**
    *  ["access_token": 2.00NmzIkFsVU5vC10bf5c4028SqVpcD, "remind_in": 131433, "uid": 5262519713, "expires_in": 131433]
    */
    
    var access_token :String?;
    var remind_in :Double?;
    var uid :Double?;
    var expires_in : Double? {
        
        didSet {
            
            expires_Date = NSDate(timeIntervalSinceNow: self.expires_in!);
            
        }
    }
    var expires_Date : NSDate?
    
    lazy var userAccountPath : String = {
        
        let path = UserAccount.getPath();
        
        return path;
    
    }();
    
    class func getPath()-> String {
        let cacheDir : String = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, .UserDomainMask, true).last!;
        let filePath:String   = cacheDir + "/userAccount.plist"
        return filePath;
    }
    
    init(dict:[String : AnyObject]?) {
        super.init();
        
        setValuesForKeysWithDictionary(dict!);
        
    }
    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
        
    }
    
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init()
        self.access_token = aDecoder.decodeObjectForKey("access_token") as? String;
        self.remind_in    = aDecoder.decodeObjectForKey("remind_in") as? Double ;
        self.uid          = aDecoder.decodeObjectForKey("uid") as? Double;
        self.expires_in   = aDecoder.decodeObjectForKey("expires_in") as? Double;
        self.expires_Date = aDecoder.decodeObjectForKey("expires_Date") as? NSDate;

    }
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.access_token, forKey: "access_token");
        aCoder.encodeObject(self.remind_in, forKey: "remind_in");
        aCoder.encodeObject(self.uid, forKey: "uid");
        aCoder.encodeObject(self.expires_in, forKey: "expires_in");
        aCoder.encodeObject(self.expires_Date, forKey: "expires_Date");
    }
    
    func saveUserAccount() {
      
        let success           = NSKeyedArchiver.archiveRootObject(self, toFile: userAccountPath);

        print(success);
        
        
    }
    
    class func getUserAccount() -> UserAccount? {
   
        
//        let userAccount = ni
    
     
        
        
        return userAccount;
    
    }
    
    class func userHasAuth() ->Bool {
        let path = self.getPath();
        
        let userAccount: UserAccount?  = NSKeyedUnarchiver.unarchiveObjectWithFile(path) as? UserAccount;
    
        
        
        return false;
    }
    

}

