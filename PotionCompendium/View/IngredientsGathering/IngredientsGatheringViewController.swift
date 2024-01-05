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

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        screen = IngredientsGatheringView(frame: UIScreen.main.bounds)
        self.view = screen!
        self.screen!.collision?.collisionDelegate = self

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

    func youLostMessage() {
        let alert = UIAlertController(
                    title: title,
                    message: "you lost :(",
                    preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(
                    title: "try again",
                    style: UIAlertAction.Style.default) { _ in
                        self.screen?.isGameOver = false
                        self.screen?.appUI.score = 0
                    })
                self.present(alert, animated: true, completion: nil)
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

            if item is SpoiledIngredient {
                self.screen?.isGameOver = true
                youLostMessage()
            } else {
                self.screen?.appUI.score += 1
            }

            screen.collision.removeItem(item)
    }
}
