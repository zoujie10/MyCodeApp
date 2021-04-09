//
//  SceneDelegate.m
//  MyCodeApp
//
//  Created by 邹杰 on 4/6/21.
//

#import "SceneDelegate.h"
#import "ZJ_CodeBlockVC.h"
#import "FunctionCodeListVC.h"
#import "ThirdPartyDemoVC.h"
@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    [self didInitWindow];
}
- (void)didInitWindow {
    self.window.rootViewController = [self generateWindowRootViewController];
    [self initNavBarItemTitleTextColor];
    [self.window makeKeyAndVisible];
}

- (UIViewController *)generateWindowRootViewController {
    UITabBarController *tab = [[UITabBarController alloc]init];
    
    ZJ_CodeBlockVC *codeBlockVC = [[ZJ_CodeBlockVC alloc]init];
    codeBlockVC.hidesBottomBarWhenPushed = NO;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:codeBlockVC];
    nav.title = @"codeBlockList";
    nav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"代码块" image:UIImageMake(@"icon_tabbar_uikit") tag:0];
//    nav.tabBarItem.selectedImage = UIImageMake(@"icon_tabbar_uikit_selected");//变蓝色
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_uikit_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//原图
  
    FunctionCodeListVC *functionCodelist = [[FunctionCodeListVC alloc]init];
    functionCodelist.hidesBottomBarWhenPushed = NO;
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:functionCodelist];
    nav1.title = @"functionCodeList";
    nav1.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"常用功能" image:UIImageMake(@"icon_tabbar_component") tag:1];
    nav1.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_component_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    ThirdPartyDemoVC *thirdVC = [[ThirdPartyDemoVC alloc]init];
    thirdVC.hidesBottomBarWhenPushed = NO;
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:thirdVC];
    nav2.title = @"thirdPartyList";
    nav2.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"第三方" image:UIImageMake(@"icon_tabbar_lab") tag:2];
//    nav2.tabBarItem.selectedImage = UIImageMake(@"icon_tabbar_lab_selected");
    nav2.tabBarItem.selectedImage = [[UIImage imageNamed:@"icon_tabbar_lab_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tab.viewControllers = @[nav,nav1,nav2];
    return tab;
}

-(void)initNavBarItemTitleTextColor{
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-300, 0) forBarMetrics:UIBarMetricsDefault];
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor],NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateSelected];
    if (@available(iOS 13.0, *)) {
        [[UITabBar appearance] setTintColor:[UIColor redColor]];
        [[UITabBar appearance] setUnselectedItemTintColor:[UIColor whiteColor]];
    }
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
