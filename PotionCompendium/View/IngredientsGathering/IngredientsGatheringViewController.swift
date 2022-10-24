//
//  IngredientsGatheringViewController.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit
import AVFAudio

class IngredientsGatheringViewController: UIViewController {
    var screen: IngredientsGatheringView?

    var collectedIngredientsPercentage = 0

    var collectedIngredientsCounter = 0 {
        didSet {
            guard let progressBarHeight = self.screen?.progressBar.frame.height else {
                return
            }

//            100 -> 200
//            X -> qtdColetada
//            200X = 100qtdColetada
//            x = 100qtdColeta/200

            let maxHeight = self.screen?.progressBar.frame.height
            self.collectedIngredientsPercentage = collectedIngredientsCounter * Int(progressBarHeight) / 100

            if (Double(collectedIngredientsPercentage) <= Double(maxHeight!)) {
                self.screen?.progressBar.progressMadeHeightConstraint
                    .constant = CGFloat(collectedIngredientsPercentage)
            } else {
                self.screen?.remainingTime = 0
            }
        }
    }

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        screen = IngredientsGatheringView(frame: UIScreen.main.bounds)
        self.view = screen!
        self.screen!.collision?.collisionDelegate = self
        self.screen?.actionWhenPhaseOver = nextPhase

        loadAudio()
    }

    func loadAudio() {
        if let asset = NSDataAsset(name: "pickup") {
            do {
                player = try AVAudioPlayer(data: asset.data, fileTypeHint: "mp3")
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

    func nextPhase() {
        let nextScreen = PotionBrewingViewController()
        nextScreen.collectedIngredientsPercentage = self.collectedIngredientsCounter
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }

    func getSecondsAsMinutesAndSeconds(_ seconds: Double) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        let formattedString = formatter.string(from: TimeInterval(seconds))
        return formattedString
    }
}

extension IngredientsGatheringViewController: UICollisionBehaviorDelegate {

    func collisionBehavior(
        _ behavior: UICollisionBehavior,
        beganContactFor item: UIDynamicItem,
        withBoundaryIdentifier identifier: NSCopying?,
        at point: CGPoint) {
            (item as? UIView)?.frame = CGRect(
                x: item.bounds.midX,
                y: item.bounds.midY,
                width: 0,
                height: 0)
            player?.play()
            player?.volume = 0.5
    }

    func collisionBehavior(
        _ behavior: UICollisionBehavior,
        endedContactFor item: UIDynamicItem,
        withBoundaryIdentifier identifier: NSCopying?) {
            guard let screen = self.screen else {
                return
            }
            collectedIngredientsCounter += 1
            screen.collision.removeItem(item)
    }
}
