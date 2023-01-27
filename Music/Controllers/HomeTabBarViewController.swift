//
//  ViewController.swift
//  Music
//
//  Created by Aksaule on 24.11.2022.
//

import UIKit
import SnapKit

class HomeTabBarViewController: UITabBarController {

    let v1 = UINavigationController(rootViewController: HomeViewController())
    let v2 = UINavigationController(rootViewController: RingtoneViewController())
   
    override func viewDidLoad() {
        super.viewDidLoad()
        v1.title = "Wallpapers"
        v2.title = "Ringtones"
       
        UITabBar.appearance().unselectedItemTintColor = .black
        setViewControllers([v1,v2], animated: true)
        v1.tabBarItem.image = UIImage(systemName: "photo.tv")
        v2.tabBarItem.image = UIImage(systemName: "waveform")
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = UIColor(red: 232/255, green: 79/255, blue: 79/255, alpha: 1.0)
    }
}
