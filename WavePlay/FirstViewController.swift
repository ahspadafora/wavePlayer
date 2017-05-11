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
        
        waveTableView.delaysContentTouches = false
        addSubviews()
        addConstraints()
        setUpWaveTableView()
    }
    
    func addSubviews(){
        for view in waveTableView.subviews {
            if view is UIScrollView {
                (view as? UIScrollView)!.delaysContentTouches = false
                break
            }
        }
        let _ = [waveTableView,topView].map{self.view.addSubview($0)}
        topView.addSubview(recordWaveBttn)
    }
    func addConstraints(){
        waveTableView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        recordWaveBttn.translatesAutoresizingMaskIntoConstraints = false
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        let _ = [waveTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0), waveTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.65), waveTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), waveTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), waveTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)].map{$0.isActive = true}
        
        let _ = [topView.topAnchor.constraint(equalTo: self.view.topAnchor), topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), topView.widthAnchor.constraint(equalTo: self.view.widthAnchor), topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.35), topView.bottomAnchor.constraint(equalTo: waveTableView.topAnchor)].map{$0.isActive = true}
        
        let _ = [recordWaveBttn.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.45), recordWaveBttn.widthAnchor.constraint(equalTo: recordWaveBttn.heightAnchor), recordWaveBttn.centerXAnchor.constraint(equalTo: topView.centerXAnchor), recordWaveBttn.centerYAnchor.constraint(equalTo: topView.centerYAnchor)].map{$0.isActive = true}
    }
    func setUpWaveTableView(){
        waveTableView.delegate = self
        waveTableView.dataSource = self
        waveTableView.register(WaveTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = waveTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WaveTableViewCell
        cell.backgroundColor = .clear
        cell.contentView.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
        
    }
    
    
    // MARK: - SubView Properties
    private var waveTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.clear
        view.separatorStyle = UITableViewCellSeparatorStyle.none
        return view
    }()
    
    private var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var recordWaveBttn: UIButton = {
        let bttn = UIButton(type: .custom)
        bttn.setBackgroundImage(UIImage(named: "recordWave"), for: .normal)
        return bttn
    }()
    
    private var topView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.25))
}









