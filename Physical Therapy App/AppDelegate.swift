//
//  AppDelegate.swift
//  Physical Therapy App
//
//  Created by Alek Matthiessen on 7/13/20.
//  Copyright © 2020 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseStorage
import FirebaseDatabase
import Purchases
import FBSDKCoreKit
import Player

var ref: DatabaseReference?
var uid = String()
var didpurchase = Bool()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var purchases: Purchases?

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        FirebaseApp.configure()
        
        ref = Database.database().reference()

        uid = UIDevice.current.identifierForVendor?.uuidString ?? "x"
        
        Purchases.debugLogsEnabled = true
                 Purchases.configure(withAPIKey: "YuMbZXigVRCOrvLStdviFvUqYzgKMTFN", appUserID: nil)
        
        AppEvents.activateApp()

        let mainStoryboardIpad : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
           let tabBarBuyer : UITabBarController = mainStoryboardIpad.instantiateViewController(withIdentifier: "HomeTab") as! UITabBarController

        self.window = UIWindow(frame: UIScreen.main.bounds)
          self.window?.rootViewController = tabBarBuyer

          self.window?.makeKeyAndVisible()
          

        queryforinfo()

        
        return true
    }
    
    func queryforinfo() {
                        
                ref?.child("Users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    let value = snapshot.value as? NSDictionary
                    
             
                    
                    if let purchased = value?["Purchased"] as? String {
                        
                        if purchased == "True" {
                            
                            didpurchase = true
                            
                        } else {
                                         
    //                        didpurchase = true

                            didpurchase = false
                            
                        }
                        
                    } else {
                        
    //                    didpurchase = true

                        
                        didpurchase = false
                    }
             
                })
                
            }

    // MARK: UISceneSession Lifecycle




}

