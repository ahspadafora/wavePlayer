//
//  AboutWavesViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/5/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class AboutWavesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "DDF3F4")
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews(){
        self.view.addSubview(aboutWavesView)
        self.aboutWavesView.addSubview(aboutWavesLabel)
    }
    
    private func addConstraints(){
        aboutWavesView.translatesAutoresizingMaskIntoConstraints = false
        aboutWavesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let _ = [aboutWavesView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), aboutWavesView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), aboutWavesView.widthAnchor.constraint(equalTo: self.view.widthAnchor), aboutWavesView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor), aboutWavesView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.75)].map{$0.isActive = true }
        
        let _ = [aboutWavesLabel.leadingAnchor.constraint(equalTo: aboutWavesView.leadingAnchor, constant: 8.0), aboutWavesLabel.trailingAnchor.constraint(equalTo: aboutWavesView.trailingAnchor, constant: -8.0), aboutWavesView.heightAnchor.constraint(equalTo: aboutWavesView.heightAnchor, multiplier: 0.85), aboutWavesLabel.centerYAnchor.constraint(equalTo: aboutWavesView.centerYAnchor)].map{$0.isActive = true}
    }
    
    private var aboutWavesView = UIView()
    private var aboutWavesLabel: UILabel = {
        let label = UILabel()
        label.text = "WavePlay is an anonymous platform where a user(\"waver\") can post an anonymous audio recording (\"wave\") to a community within a 1.5 mile radius. \n \n In the global setting format(\"WorldWave\") \"waves\" have the option to send and receive anonymous recordings to any other one particular waver in the world"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
}
