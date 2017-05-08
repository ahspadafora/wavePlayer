//
//  FirstViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/1/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "DDF3F4")
        self.title = ""
        addSubviews()
        addConstraints()
        setUpWaveTableView()
    }
    
    func addSubviews(){
        let _ = [waveTableView].map{self.view.addSubview($0)}
    }
    
    func addConstraints(){
        waveTableView.translatesAutoresizingMaskIntoConstraints = false
        
        let _ = [waveTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0), waveTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.75), waveTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), waveTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), waveTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)].map{$0.isActive = true}
        
        
    }
    
    func setUpWaveTableView(){
        waveTableView.delegate = self
        waveTableView.dataSource = self
        waveTableView.register(WaveTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = waveTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WaveTableViewCell
        cell.backgroundColor = .clear
        return cell
    }
    
    var waveTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.clear
        view.separatorStyle = UITableViewCellSeparatorStyle.none
        view.rowHeight = 200
        return view
    }()
}









