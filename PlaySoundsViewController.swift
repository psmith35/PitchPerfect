//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Paul Smith on 12/11/20.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(false)
    }
    
    // MARK: Actions
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(sender) {
            case slowButton:
                playSound(rate: 0.5)
            case fastButton:
                playSound(rate: 1.5)
            case chipmunkButton:
                playSound(pitch: 1000)
            case vaderButton:
                playSound(pitch: -1000)
            case echoButton:
                playSound(echo: true)
            case reverbButton:
                playSound(reverb: true)
        default:
            print("Button not found")
        }

            configureUI(true)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

}
