//
//  WaveTableViewCell.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/7/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit

class WaveTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.isUserInteractionEnabled = true
        self.contentView.backgroundColor = .clear

        let _ = [playWaveBttn, viewPostBttn, recordWaveBttn, playLabel, recordLabel].map{self.contentView.addSubview($0)}
        
        setSubViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func setSubViewConstraints(){
        let _ = [playWaveBttn, recordWaveBttn, viewPostBttn, playLabel, recordLabel].map{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        let _ = [playWaveBttn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45), playWaveBttn.widthAnchor.constraint(equalTo: playWaveBttn.heightAnchor), playWaveBttn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8.0), playWaveBttn.centerYAnchor.constraint(equalTo: self.centerYAnchor)].map{$0.isActive = true}
        playWaveBttn.imageView?.contentMode = .scaleAspectFit
        
        let _ = [viewPostBttn.leadingAnchor.constraint(equalTo: playWaveBttn.trailingAnchor), viewPostBttn.trailingAnchor.constraint(equalTo: recordWaveBttn.leadingAnchor), viewPostBttn.centerYAnchor.constraint(equalTo: recordWaveBttn.centerYAnchor)].map{$0.isActive = true}
        
        let _ = [recordWaveBttn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45), recordWaveBttn.widthAnchor.constraint(equalTo: recordWaveBttn.heightAnchor), recordWaveBttn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8.0), recordWaveBttn.centerYAnchor.constraint(equalTo: self.centerYAnchor)].map{$0.isActive = true}
        
        let _ = [playLabel.bottomAnchor.constraint(equalTo: playWaveBttn.topAnchor), playLabel.centerXAnchor.constraint(equalTo: playWaveBttn.centerXAnchor)].map{$0.isActive = true}
        
        let _ = [recordLabel.centerXAnchor.constraint(equalTo: recordWaveBttn.centerXAnchor), recordLabel.bottomAnchor.constraint(equalTo: recordWaveBttn.topAnchor)].map{$0.isActive = true}
    }
    
    private var playLabel: UILabel = {
        let label = UILabel()
        label.text = "Play"
        label.font = UIFont(name: "Avenir-Book", size: 12.0)
        label.backgroundColor = .clear
        return label
    }()
    
    private var recordLabel: UILabel = {
        let label = UILabel()
        label.text = "Record"
        label.font = UIFont(name: "Avenir-Book", size: 12.0)
        label.backgroundColor = .clear
        return label
    }()
    
    var playWaveBttn: UIButton = {
        let bttn = UIButton()
        //bttn.setImage(play, for: .normal)
        bttn.setBackgroundImage(#imageLiteral(resourceName: "playWave"), for: .normal)
        bttn.isUserInteractionEnabled = true
        return bttn
    }()
    
    var recordWaveBttn: UIButton = {
        let bttn = UIButton()
        bttn.setBackgroundImage(#imageLiteral(resourceName: "recordWave"), for: .normal)
        bttn.isUserInteractionEnabled = true
        return bttn
    }()
    
    var viewPostBttn: UIButton = {
        let bttn = UIButton(type: UIButtonType.custom)
        bttn.setTitle("View Post", for: .normal)
        bttn.isUserInteractionEnabled = true
        bttn.setTitleColor(UIColor.darkGray, for: .normal)
        bttn.titleLabel?.font = UIFont(name: "Avenir-Book", size: 12.0)
        return bttn
    }()
    
}
