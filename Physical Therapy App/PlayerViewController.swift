//
//  PlayerViewController.swift
//  Physical Therapy App
//
//  Created by Alek Matthiessen on 7/13/20.
//  Copyright © 2020 The Matthiessen Group, LLC. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import Player

class PlayerViewController: UIViewController, PlayerDelegate, PlayerPlaybackDelegate {
    func playerPlaybackWillLoop(_ player: Player) {
        
    }
    
    
    func playerPlaybackDidLoop(_ player: Player) {
        
    }
    
    
    func playerReady(_ player: Player) {
        
    }
    
    func playerPlaybackStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferingStateDidChange(_ player: Player) {
        
    }
    
    func playerBufferTimeDidChange(_ bufferTime: Double) {
        
    }
    
    func player(_ player: Player, didFailWithError error: Error?) {
        
    }
    
    
    public func playerPlaybackWillStartFromBeginning(_ player: Player) {
    }

    public func playerPlaybackDidEnd(_ player: Player) {
    }

    public func playerCurrentTimeDidChange(_ player: Player) {
        let fraction = Double(player.currentTime) / Double(player.maximumDuration)
        
        progressView.setProgress(Float(fraction), animated: true)
        
//        self.playbackViewController?.setProgress(progress: CGFloat(fraction), animated: true)
    }

  
    @IBOutlet weak var tapback: UIButton!
    @IBAction func tapBack(_ sender: Any) {
    }
    var player = Player()
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.player = Player()
        self.player.playerDelegate = self
        self.player.playbackDelegate = self
        self.player.view.frame = self.view.bounds

        self.addChild(self.player)
        self.view.addSubview(self.player.view)
        self.player.didMove(toParent: self)
        
        var imageUrl2 = URL(string: selectedurl)

        let videoUrl = imageUrl2  // file or http url
        self.player.url = videoUrl
        
        self.player.playFromBeginning()
        
        self.player.fillMode = .resizeAspectFill


        let tapGestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureRecognizer(_:)))
         tapGestureRecognizer.numberOfTapsRequired = 1
         self.player.view.addGestureRecognizer(tapGestureRecognizer)

        self.view.bringSubviewToFront(progressView)
        self.view.bringSubviewToFront(tapback)


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlayerViewController {
    
    @objc func handleTapGestureRecognizer(_ gestureRecognizer: UITapGestureRecognizer) {
        switch self.player.playbackState {
        case .stopped:
            self.player.playFromBeginning()
            break
        case .paused:
            self.player.playFromCurrentTime()
            break
        case .playing:
            self.player.pause()
            break
        case .failed:
            self.player.pause()
            break
        }
    }
    
}



