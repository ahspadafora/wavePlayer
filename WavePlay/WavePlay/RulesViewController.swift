//
//  RulesViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/3/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "E4C2B9")
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews(){
        grayView.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let _ = [grayView].map{self.view.addSubview($0)}
        grayView.addSubview(rulesLabel)
    }
    
    private func addConstraints(){
        let _ = [grayView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), grayView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor), grayView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.65), grayView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75)].map{$0.isActive = true}
        
        let _ = [rulesLabel.centerYAnchor.constraint(equalTo: (rulesLabel.superview?.centerYAnchor)!), rulesLabel.centerXAnchor.constraint(equalTo: (rulesLabel.superview?.centerXAnchor)!), rulesLabel.heightAnchor.constraint(equalTo: (rulesLabel.superview?.heightAnchor)!), rulesLabel.widthAnchor.constraint(equalTo: (rulesLabel.superview?.widthAnchor)!)].map{$0.isActive = true}
    }
    
    let grayView: UIView = {
        var v = UIView()
        v.backgroundColor = UIColor(hexString: "B8A5A1")
        return v
    }()
    
    let rulesLabel: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        textView.textAlignment = .center
        textView.text = "Rules \n \n \n 1.Take care of eachother \n \n"
        return textView
    }()
    
}
