//
//  PotionBrewingViewController.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit
import Combine

class PotionBrewingViewController: UIViewController {
    var collectedIngredientsPercentage = 0
    var screen: PotionBrewingView?
    var ingredientViewModel = IngredientViewModel()
    var potionViewModel = PotionViewModel()
    var potion: Potion? {
        didSet {
            if self.potion != nil {
                print(self.potion?.name)
            } else {
                print("nenhuma poção descoberta :(")
            }
        }
    }
    private var cancellables: Set<AnyCancellable> = []
    var selectedIngredients: [Ingredient] = [] {
        didSet {
            for ingredient in selectedIngredients {
                print(ingredient.name!)
            }
//            print(selectedIngredients!)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        screen = PotionBrewingView(frame: CGRect(
            x: self.view.bounds.midX,
            y: self.view.bounds.midY,
            width: self.view.bounds.width,
            height: self.view.bounds.height))

        self.screen?.tableView.delegate = self
        self.screen?.tableView.dataSource = self

        self.view = screen!
        self.screen?.brewButton.addTarget(self, action: #selector(bindPotionViewModel), for: .touchUpInside)
        bindIngredientViewModel()
    }

    @objc
    func bindPotionViewModel() {
        self.potionViewModel.fetchPotionsAndVerifyIngredients(ingredients: selectedIngredients)

        potionViewModel.$potion
            .receive(on: DispatchQueue.main)
            .sink { [weak self] potion in
                self?.potion = potion
            }
            .store(in: &cancellables)

        showResult()
    }

    private func showResult() {
        var title = ""
        var message = ""
        if self.potion == nil {
            title = "Oh oh that didn't work"
            message = "The ingredients you chose resulted in a dangerous looking goo, better luck next time!"
        } else {
            title = self.potion!.name!
            message = "You discovered \(self.potion!.name!)"
        }

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }

    private func bindIngredientViewModel() {
        if self.collectedIngredientsPercentage > 100 {
            self.ingredientViewModel.fetchRandomXIngredients(percentage: 100)
        } else {
            self.ingredientViewModel
                .fetchRandomXIngredients(percentage: Float(self.collectedIngredientsPercentage))
        }

        ingredientViewModel.$ingredients
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.screen?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension PotionBrewingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ingredientViewModel.ingredients.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIngredients.append(self.ingredientViewModel.ingredients[indexPath.row])
    }
}

extension PotionBrewingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let myCell = tableView.dequeueReusableCell(
            withIdentifier: IngredientsTableViewCell.identifier,
            for: indexPath)
                as? IngredientsTableViewCell else {
            fatalError()
        }

        myCell.textLabel?.text = self.ingredientViewModel.ingredients[indexPath.row].name!
        return myCell
    }

}
