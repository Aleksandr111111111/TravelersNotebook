//
//  AppDelegate.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 06.04.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        print(CoreDataManager.sharedInstance.persistentContainer.persistentStoreDescriptions)
//        let nf = Folder.newFolder(name: "asa")
//        nf.addNote().name = "yx"
//        nf.addNote().name = "ops"
//        nf.addNote().name = "BBBB"
//        nf.addNote().name = "QQQQQQQ"
//
//        print(folder.count)
//        print(folder[0].name!)
//
//        _ = Folder.newFolder(name: "huyvei")
//        CoreDataManager.sharedInstance.saveContext()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
    }

}
