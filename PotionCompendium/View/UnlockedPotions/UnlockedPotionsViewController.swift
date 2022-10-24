//
//  UnlockedPotionsViewController.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit
import Combine

class MyCustomTableCell: UITableViewCell {

}

class UnlockedPotionsViewController: UIViewController {
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(MyCustomTableCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    var viewModel = PotionViewModel()

    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.frame = view.bounds
        bindViewModel()
        // Do any additional setup after loading the view.
    }

    private func bindViewModel() {
        self.viewModel.fetchPotions()

        viewModel.$potions
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }
}

extension UnlockedPotionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.potions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath) as? MyCustomTableCell
        else {
            fatalError()
        }

        cell.textLabel?.text = self.viewModel.potions[indexPath.row].name
        return cell
    }
}
