//
//  PotionBrewingViewController.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit

class PotionBrewingViewController: UIViewController {
    var screen: PotionBrewingView?

    override func viewDidLoad() {
        super.viewDidLoad()

        screen = PotionBrewingView(frame: CGRect(
            x: self.view.bounds.midX,
            y: self.view.bounds.midY,
            width: self.view.bounds.width,
            height: self.view.bounds.height))

        self.view = screen!

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
