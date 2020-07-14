//
//  HomeTabViewController.swift
//  Physical Therapy App
//
//  Created by Alek Matthiessen on 7/13/20.
//  Copyright © 2020 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit

class HomeTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = true
            tabBar.backgroundImage = UIImage()
            tabBar.shadowImage = UIImage() // add this if you want remove tabBar separator
            tabBar.barTintColor = .clear
            tabBar.backgroundColor = .black // here is your tabBar color
            tabBar.layer.backgroundColor = UIColor.clear.cgColor
            

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
