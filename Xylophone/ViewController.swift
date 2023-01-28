//
//  ViewController.swift
//  Xylophone
//
//  Created by Вова on 27.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    var player: AVAudioPlayer!

    func playSound(_ sound: String?) {
        let url = Bundle.main.url(forResource: sound, withExtension: "wav")
        player = try!AVAudioPlayer(contentsOf: url!)
        player.play()

    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(sender.titleLabel?.text)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    

}

