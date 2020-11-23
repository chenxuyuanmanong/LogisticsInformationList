//
//  AppDelegate.swift
//  LogisticsInformationList
//
//  Created by kaiya on 2020/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let rootVC = ViewController()
        rootVC.view.backgroundColor = UIColor.white
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
        return true
    }

    


}

