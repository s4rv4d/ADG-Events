//
//  AppDelegate.swift
//  Events
//
//  Created by Devang Patel on 26/08/19.
//  Copyright © 2019 ADG-VIT. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Set UITabBar Tint To Black when selected
        UITabBar.appearance().tintColor = .black
        
        // Increase Launch Time
        Thread.sleep(forTimeInterval: 1.5)
        
        
        //check if already logged in
        
        if UserDefaults.standard.object(forKey: "regnumber") != nil {
            //logged in
            self.GoToMain()
        } else {
            //not logged in
            self.GoToReg()
        }
        
        return true
    }
    
    func GoToMain(){
        let mainView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBar") as! UITabBarController

        self.window?.rootViewController = mainView
    }
    
    func GoToReg(){
        let regView = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StartUpViewController") as! StartUpViewController
        
        self.window?.rootViewController = regView
    }


}

