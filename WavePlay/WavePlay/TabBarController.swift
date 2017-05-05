//
//  TabBarController.swift
//  moonCalendar
//
//  Created by Amber Spadafora on 2/27/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewWillAppear(_ animated: Bool) {
        self.tabBar.barTintColor = .white
        self.tabBar.tintColor = .black
        self.edgesForExtendedLayout = []
        
        
        let tabOne = FirstViewController()
        tabOne.edgesForExtendedLayout = []
        tabOne.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Globe Asia Filled-50"), tag: 1)
        
        let tabTwo = SecondViewController()
        tabTwo.edgesForExtendedLayout = []
        tabTwo.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Speaker Filled-50"), tag: 2)
        
        let tabThree = ThirdViewController()
        tabThree.edgesForExtendedLayout = []
        tabThree.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Appointment Reminders Filled-50"), tag: 3)
        
        //let tabFour = FourthViewController()
        let tabFour = SettingsNavigationViewController()
        tabFour.edgesForExtendedLayout = []
        tabFour.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "Settings Filled-50"), tag: 4)
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
