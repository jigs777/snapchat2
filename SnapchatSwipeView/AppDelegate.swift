//
//  AppDelegate.swift
//  SnapchatSwipeView
//
//  Created by Jake Spracher on 7/26/14.
//  Copyright (c) 2015 Jake Spracher. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .white

        UIApplication.shared.isStatusBarHidden = true

        let launchedAfter = UserDefaults.standard.bool(forKey: "afterlogin")
        if !launchedAfter
        {
            //Home screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let left = storyboard.instantiateViewController(withIdentifier: "left")
            let middle = storyboard.instantiateViewController(withIdentifier: "middle")
            let right = storyboard.instantiateViewController(withIdentifier: "right")
            let top = storyboard.instantiateViewController(withIdentifier: "top")
            //let bottom = storyboard.instantiateViewController(withIdentifier: "bottom")
            
            let snapContainer = SnapContainerViewController.containerViewWith(left,
                                                                              middleVC: middle,
                                                                              rightVC: right,
                                                                              topVC: top)
            
           let navigationController = UINavigationController(rootViewController: snapContainer)
            navigationController.isNavigationBarHidden = true
            
            self.window?.rootViewController = navigationController
            self.window?.makeKeyAndVisible()
            
        }
        else
        {
            //loginscreen
            
            
            self.window = UIWindow(frame: UIScreen.main.bounds)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "LoginSignupVC")
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
            return true

        }
        
        
        
        

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
