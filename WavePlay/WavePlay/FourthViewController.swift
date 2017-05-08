//
//  FourthViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/3/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        self.view.backgroundColor = UIColor(hexString: "DDF3F4")
        addSubViews()
        addConstraints()
    }
    
    fileprivate func addSubViews(){
        let _ = [rulesButton,aboutButton,pointsButton].map{self.view.addSubview($0)}
        let _ = [rulesButton,aboutButton,pointsButton].map{$0.isEnabled = true}
    }
    
    fileprivate func addConstraints(){
        let _ = [rulesButton, aboutButton, pointsButton].map{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        let _ = [rulesButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), rulesButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor), rulesButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85), rulesButton.heightAnchor.constraint(equalToConstant: 50)].map{$0.isActive = true}
        
        let _ = [aboutButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), aboutButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85), aboutButton.heightAnchor.constraint(equalToConstant: 50), aboutButton.topAnchor.constraint(equalTo: rulesButton.bottomAnchor)].map{$0.isActive = true}
        
        let _ = [pointsButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), pointsButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85), pointsButton.heightAnchor.constraint(equalToConstant: 50), pointsButton.topAnchor.constraint(equalTo: aboutButton.bottomAnchor)].map{$0.isActive = true}
        
    }
    
    func goToRulesPage(_ sender: UIButton){
        print("button pressed")
        self.navigationController?.pushViewController(RulesViewController(), animated: true)
    }
    
    func goToAboutPage(_ sender: UIButton){
        print("button pressed")
        self.navigationController?.pushViewController(AboutWavesViewController(), animated: true)
    }
    
    let rulesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        button.setTitle("Rules", for: .normal)
        button.titleLabel?.textColor = .black
        button.addTarget(self, action:#selector(goToRulesPage), for: .touchUpInside)
        return button
    }()
    
    let aboutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        button.setTitle("What is WavePlay?", for: .normal)
        button.titleLabel?.textColor = .black
        button.addTarget(self, action:#selector(goToRulesPage), for: .touchUpInside)
        return button
    }()
    
    let pointsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.gray
        button.setTitle("Can I redeem my points? (coming soon)", for: .normal)
        button.titleLabel?.textColor = .black
        return button
    }()
}
