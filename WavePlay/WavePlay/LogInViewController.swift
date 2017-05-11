//
//  LogInViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/11/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    let handle = FIRAuth.auth()
    
    let defaults = UserDefaults.standard
    //var delegate: LoginDelegate?
    let appD = UIApplication.shared.delegate as! AppDelegate
    var user: FIRUser?
    
    override func viewWillAppear(_ animated: Bool) {
        handle?.addStateDidChangeListener({ (auth, user) in
            if let user = user {
                print("user uid is: \(user.uid)")
                self.present(TabBarController(), animated: true, completion: nil)
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        handle?.removeStateDidChangeListener(handle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "DDF3F4")
        setUpSubViews()
    }
    
    func setUpSubViews(){
        self.view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let _ = [loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 10)].map{$0.isActive = true}
    }
    
    func didTapLogin(){
        print("did tap login")
        FIRAuth.auth()!.signInAnonymously { (user, error) in
            if user != nil {
                self.defaults.set(user!.uid, forKey: "fid")
            }
        }
    }
    
    // MARK: - Subview Properties
    private var loginButton: UIButton = {
        let bttn = UIButton(type: .custom)
        bttn.setBackgroundImage(UIImage(named: "EnterBttn"), for: .normal)
        bttn.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return bttn
    }()
    
    
}
