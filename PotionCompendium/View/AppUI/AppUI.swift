//
//  AppUI.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 22/10/22.
//

import UIKit
import AVFAudio

class AppUI: UIView {
    static let shared = AppUI()

    var backgroundMusicPlayer: AVAudioPlayer? {
        get {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError()
            }
            return appDelegate.backgroundMusicPlayer
        }
        set {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                fatalError()
            }
            appDelegate.backgroundMusicPlayer = newValue
        }
    }

    lazy var disableMusicButton: UIButton = {
        let button = UIButton()
        let image = self.isSoundOn ? UIImage(named: "sound_on") : UIImage(named: "sound_off")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleAudio), for: .touchUpInside)
        return button
    }()

    var isSoundOn: Bool = true {
        didSet {
            let image: UIImage?
            if isSoundOn {
                image = UIImage(named: "sound_on")
                backgroundMusicPlayer?.play()
            } else {
                image = UIImage(named: "sound_off")
                backgroundMusicPlayer?.stop()
            }

            self.disableMusicButton.setImage(image, for: .normal)
        }
    }

    @objc
    func toggleAudio() {
        self.isSoundOn.toggle()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(disableMusicButton)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            disableMusicButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            disableMusicButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            disableMusicButton.widthAnchor.constraint(equalToConstant: 28),
            disableMusicButton.heightAnchor.constraint(equalTo: disableMusicButton.widthAnchor)
        ])
    }
}
