//
//  musicViewController.swift
//  musicplayerApp
//
//  Created by Deepinderpal Singh on 18/12/24.
//

// using drag and drop

import UIKit
import AVFoundation

class musicViewController: UIViewController {
    
    public var position: Int = 0
    public var song: [Song] = []
    
    @IBOutlet var holder: UIView!
    @IBOutlet weak var albumViewImage: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //if holder.subviews.count == 0 {
            configure()
       // }
    }
        
        func configure(){
            let song = self.song[position]
            
            let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
            
            do{
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let urlString = urlString else {
                    print("url strin is nil")
                    return
                }
                player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
                guard let player = player else{
                    print("player is nil")
                    return
                }
                player.volume = 0.5
                
                player.play()
            }catch{
                print("error occured")
            }
            
            //album cover
            albumViewImage.image = UIImage(named: song.imageName)

            //songs label
            songNameLabel.text = song.name
            albumNameLabel.text = song.albumName
            artistNameLabel.text = song.artistName

            
            slider.value = 0.5
        }
        
        @IBOutlet weak var slider: UISlider!
        @IBOutlet weak var playPauseButton: UIButton!
        
        @IBAction func pausePlayButton(_ sender: UIButton) {
            if player?.isPlaying == true {
                player?.pause()
                //playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            }else{
                player?.play()
                //playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            }
        }
        
        @IBAction func nextButton(_ sender: UIButton) {
            if position < (song.count - 1) {
                position = position + 1
                player?.stop()
                configure()
            }
        }
    
        @IBAction func backButton(_ sender: UIButton) {
            if position > 0 {
                position = position - 1
                player?.stop()
                configure()
            }
        }
    
        @IBAction func sliderView(_ sender: UISlider) {
            let value = slider.value
            player?.volume = value
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
        
    }
