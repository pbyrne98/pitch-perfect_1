//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Paul Byrne on 16/03/2015.
//  Copyright (c) 2015 Paul Byrne. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate=true
        
        audioEngine=AVAudioEngine()
        audioFile=AVAudioFile(forReading: receivedAudio.filePathURL , error: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func playAudioWithVariablePitch(pitch:Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch=pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    
    func playAudio(playRate:Float) {
        audioPlayer.stop()
        audioPlayer.currentTime=0
        audioPlayer.rate = playRate
        audioPlayer.play()
        
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        // Play sloooow audio here!
        audioEngine.stop()
        audioEngine.reset()
        playAudio(0.5)
    }

    @IBAction func playFastAudio(sender: UIButton) {
        // Play fast audio here!
        audioEngine.stop()
        audioEngine.reset()
        playAudio(2.0)
    }

    @IBAction func playChimpmunkAudio(sender: UIButton) {
        // Play recording as a Chipmunk
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        // Play recording as DarthVader
        playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        // Stop all audio
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.currentTime=0
    }

}
