//
//  CYTabbarController.swift
//  SinaWeibo-Swift
//
//  Created by 董招兵 on 16/7/11.
//  Copyright © 2016年 上海触影文化传播有限公司. All rights reserved.
//

import UIKit

class CYTabbarController: UITabBarController {

    lazy var compostButton : UIButton = {
    
        let button          = UIButton(type: .Custom)
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal);
        button.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Selected);
        button.setImage(UIImage(named: "tabbar_compose_icon_add"), forState:.Normal);
        button.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), forState:.Selected);

        var itemW : CGFloat = self.view.frame.size.width / CGFloat(self.childViewControllers.count);

        var itemH : CGFloat = self.tabBar.frame.size.height;

        var itemX : CGFloat = CGFloat(2*itemW);

        var rect : CGRect   = CGRectMake(itemX, 0.0, itemW, itemH);

        button.frame        = rect;

        button.addTarget(self, action: "composeButtonClick:", forControlEvents: .TouchUpInside);
        
        return button;
        
    
    }()
    
    func composeButtonClick(button : UIButton) {
        
        let authViewController = CYAuthViewController();
        
        self.presentViewController(authViewController, animated: true, completion: nil);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor();
        self.addChildControllers();
        self.selectedIndex = 0;
        self.tabBar.addSubview(self.compostButton);

   
    }
    
    func addChildControllers (){
       
        // 首页
        let homeViewController : HomeViewController         = HomeViewController();

        // 消息
        let messageViewController : CYMessageViewController = CYMessageViewController();
        // 广场
        let discoverViewController : DiscoverViewController = DiscoverViewController();

        // 我的
        let profileViewController : CYProfileViewController = CYProfileViewController();


        setupViewController(homeViewController, normalImg: "tabbar_home", selectImg: "tabbar_home_highlighted", title: "首页");
        setupViewController(messageViewController, normalImg: "tabbar_message_center", selectImg: "tabbar_message_center_highlighted", title: "消息");
        
        setupViewController(UIViewController(), normalImg: "tabbar_discover", selectImg: "tabbar_discover", title: "");

        setupViewController(discoverViewController, normalImg: "tabbar_discover", selectImg: "tabbar_discover_highlighted", title: "广场");

        setupViewController(profileViewController, normalImg: "tabbar_profile", selectImg: "tabbar_profile_highlighted", title: "我的");

    }

    func setupViewController(viewController: UIViewController,normalImg:String,selectImg:String,title:String) {

        viewController.tabBarItem.image         = UIImage(named: normalImg);
        viewController.tabBarItem.selectedImage = UIImage(named: selectImg)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal);
        viewController.tabBarItem.title         = title;
        viewController.title                    = title;
        viewController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orangeColor()], forState: UIControlState.Selected);
        let nav : UINavigationController        = UINavigationController(rootViewController: viewController);
    
        addChildViewController(nav);
    
    }


}
