//
//  FirstViewController.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/1/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var settings = [String: Int]()
    var meterTimer:Timer!
    var permissionToRecord: Bool = false
    var isRecording: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAudioRecordingPermission()
        self.view.backgroundColor = UIColor(hexString: "DDF3F4")
        
        let alertController = UIAlertController(title: "Permission to record", message: "When prompted, please give permission to record in order to send a wave", preferredStyle: .alert)
        let action = UIAlertAction(title: "Permission to record", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
        
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
        let _ = [waveTableView, topView].map{self.view.addSubview($0)}
        
        let _ = [recordWaveBttn, leftLabelStackView, rightLabelStackView, showLabel, filterByLabel].map{topView.addSubview($0)}
        
        let _ = [localWavesButton, randomWavesButton].map{leftLabelStackView.addArrangedSubview($0)}
        let _ = [highestRatedButton, mostRecentWavesBttn].map{rightLabelStackView.addArrangedSubview($0)}
    }
    
    func addConstraints(){
        let _ = [waveTableView, logoImageView, recordWaveBttn, topView, leftLabelStackView, localWavesButton, randomWavesButton, rightLabelStackView, highestRatedButton, mostRecentWavesBttn, showLabel, filterByLabel].map{$0.translatesAutoresizingMaskIntoConstraints = false}
        
        let _ = [waveTableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 1.0), waveTableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.65), waveTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor), waveTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), waveTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)].map{$0.isActive = true}
        
        let _ = [topView.topAnchor.constraint(equalTo: self.view.topAnchor), topView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor), topView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor), topView.widthAnchor.constraint(equalTo: self.view.widthAnchor), topView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.35), topView.bottomAnchor.constraint(equalTo: waveTableView.topAnchor)].map{$0.isActive = true}
        
        let _ = [recordWaveBttn.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 0.45), recordWaveBttn.widthAnchor.constraint(equalTo: recordWaveBttn.heightAnchor), recordWaveBttn.centerXAnchor.constraint(equalTo: topView.centerXAnchor), recordWaveBttn.centerYAnchor.constraint(equalTo: topView.centerYAnchor)].map{$0.isActive = true}
        
        let _ = [leftLabelStackView.trailingAnchor.constraint(equalTo: recordWaveBttn.leadingAnchor), leftLabelStackView.centerYAnchor.constraint(equalTo: recordWaveBttn.centerYAnchor), leftLabelStackView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 8.0)].map{$0.isActive = true}
        
        let _ = [rightLabelStackView.leadingAnchor.constraint(equalTo: recordWaveBttn.trailingAnchor), rightLabelStackView.centerYAnchor.constraint(equalTo: recordWaveBttn.centerYAnchor), rightLabelStackView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -8.0)].map{$0.isActive = true}
        
        let _ = [filterByLabel.bottomAnchor.constraint(equalTo: rightLabelStackView.topAnchor), filterByLabel.widthAnchor.constraint(equalTo: rightLabelStackView.widthAnchor), filterByLabel.leadingAnchor.constraint(equalTo: rightLabelStackView.leadingAnchor), filterByLabel.trailingAnchor.constraint(equalTo: rightLabelStackView.trailingAnchor)].map{$0.isActive = true}
        
        let _ = [showLabel.bottomAnchor.constraint(equalTo: leftLabelStackView.topAnchor), showLabel.widthAnchor.constraint(equalTo: leftLabelStackView.widthAnchor), showLabel.leadingAnchor.constraint(equalTo: leftLabelStackView.leadingAnchor), showLabel.trailingAnchor.constraint(equalTo: leftLabelStackView.trailingAnchor)].map{$0.isActive = true}
    }
    
    func setUpWaveTableView(){
        waveTableView.delegate = self
        waveTableView.dataSource = self
        waveTableView.register(WaveTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func playBttnPressed(_ sender: AnyObject){
        print("play bttn pressed on row: \(sender.tag)")
    }
    
    func recBttnPressed(_ sender: AnyObject){
        print("rec bttn pressed on row: \(sender.tag)")
        var send = sender as! UIButton
        if self.audioRecorder == nil {
            startRecording()
            send.isSelected = true
            send.setImage(#imageLiteral(resourceName: "stopRecordingWave"), for: .selected)
        } else {
            self.recordWaveBttn.isSelected = false
            finishAudioRecording(success: true)
            send.isSelected = false
            send.setImage(#imageLiteral(resourceName: "recordWave"), for: .normal)
        }
    }
    
    func viewPostBttnPressed(_ sender: AnyObject){
        print("view Post bttn pressed on row: \(sender.tag)")
    }
    
    // MARK: - TableView Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let cell = waveTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WaveTableViewCell
        cell.backgroundColor = .clear
        cell.contentView.isUserInteractionEnabled = true
        let _ = [cell.recordWaveBttn, cell.playWaveBttn, cell.viewPostBttn].map{$0.tag = row}
        
        cell.playWaveBttn.addTarget(self, action: #selector(playBttnPressed), for: .touchUpInside)
        cell.recordWaveBttn.addTarget(self, action: #selector(recBttnPressed), for: .touchUpInside)
        cell.viewPostBttn.addTarget(self, action: #selector(viewPostBttnPressed), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    
    // MARK: - SubView Properties
    private var waveTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.clear
        view.separatorStyle = UITableViewCellSeparatorStyle.singleLine
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
        bttn.setImage(#imageLiteral(resourceName: "stopRecordingWave"), for: UIControlState.selected)
        return bttn
    }()
    
    private var topView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.25))
    
    private var localWavesButton: UIButton = {
        let bttn = UIButton(type: UIButtonType.roundedRect)
        bttn.setTitle("Local", for: .normal)
        return bttn
    }()
    private var randomWavesButton: UIButton = {
        let bttn = UIButton(type: UIButtonType.roundedRect)
        bttn.setTitle("Random", for: .normal)
        return bttn
    }()
    private var leftLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        return stackView
    }()
    
    private var rightLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .trailing
        stackView.axis = .vertical
        return stackView
    }()
    
    private var highestRatedButton: UIButton = {
        let bttn = UIButton(type: UIButtonType.roundedRect)
        bttn.setTitle("Highest Rated", for: .normal)
        return bttn
    }()
    private var mostRecentWavesBttn: UIButton = {
        let bttn = UIButton(type: UIButtonType.roundedRect)
        bttn.setTitle("Most Recent", for: .normal)
        return bttn
    }()
    
    private var filterByLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter By"
        label.textAlignment = .right
        return label
    }()
    
    private var showLabel: UILabel = {
        let label = UILabel()
        label.text = "Show"
        label.textAlignment = .left
        return label
    }()
}

extension MainViewController: AVAudioRecorderDelegate {
    
    func startRecording() {
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        let audioFileUrl = MainViewController.getAudioFileURL()
        print(audioFileUrl.absoluteString)
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFileUrl, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
        } catch {
            finishAudioRecording(success: false)
        }
    }
    
    class func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    class func getAudioFileURL() -> URL {
        return getDocumentsDirectory().appendingPathComponent("testSound1.m4a")
    }
    
    func finishAudioRecording(success: Bool) {
        
        audioRecorder.stop()
        audioRecorder = nil
        //meterTimer.invalidate()
        
        if success {
            print("Recording finished successfully.")
        } else {
            print("Recording failed :(")
        }
    }
    
    func getAudioRecordingPermission(){
        AVAudioSession.sharedInstance().requestRecordPermission { (accessGranted) in
            if accessGranted {
                self.permissionToRecord = true
            } else {
                self.permissionToRecord = false
            }
        }
    }

    
}








