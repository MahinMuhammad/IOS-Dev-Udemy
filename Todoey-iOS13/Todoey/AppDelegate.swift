//
//  AppDelegate.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("did finish launching")
        
//        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        // When you open the realm, specify that the schema
        // is now using a newer version.
        let config = Realm.Configuration(
            schemaVersion: 4)
        // Use this configuration when opening realms
        Realm.Configuration.defaultConfiguration = config
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("application will resign active")
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("application did enter background")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("application did enter foreground")
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("application did become active")
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        //used in CoreData
//        self.saveContext()
    }
    
    //MARK: - Realm Migration
//    func migrate(){
//            let config = Realm.Configuration(
//                // Set the new schema version. This must be greater than the previously used
//                // version (if you've never set a schema version before, the version is 0).
//                schemaVersion: 1,
//
//                // Set the block which will be called automatically when opening a Realm with
//                // a schema version lower than the one set above
//                migrationBlock: { migration, oldSchemaVersion in
//
//                    if oldSchemaVersion < 1 {
//                        migration.enumerateObjects(ofType: Item.className()) { oldObject, newObject in
//                            newObject?["dateCreated"] = Date()
//                        }
//                    }
//            }
//            )
//            Realm.Configuration.defaultConfiguration = config
//        }

    // MARK: - Core Data stack

//    lazy var persistentContainer: NSPersistentContainer = {
//
//        let container = NSPersistentContainer(name: K.DataModelName)
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()

    // MARK: - Core Data Saving support

//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

}

