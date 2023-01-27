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

    var player: AVAudioPlayer?

    func playSound(_ sound: String?) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(sender.currentTitle)
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    }
    

}

