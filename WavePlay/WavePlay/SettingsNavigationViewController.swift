//
//  SettingsNavigationViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/3/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class SettingsNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([FourthViewController()], animated: false)
    }

}
