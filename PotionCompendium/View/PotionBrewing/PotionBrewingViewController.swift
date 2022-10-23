//
//  PotionBrewingViewController.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit

class PotionBrewingViewController: UIViewController {
    var screen: PotionBrewingView?
    var ingredients: [Ingredient] = Ingredient.mockedData

    override func viewDidLoad() {
        super.viewDidLoad()

        screen = PotionBrewingView(frame: CGRect(
            x: self.view.bounds.midX,
            y: self.view.bounds.midY,
            width: self.view.bounds.width,
            height: self.view.bounds.height))

        self.view = screen!

//        self.screen!.addSubview(tableView)
    }
}

extension PotionBrewingViewController: UITableViewDelegate {

}
