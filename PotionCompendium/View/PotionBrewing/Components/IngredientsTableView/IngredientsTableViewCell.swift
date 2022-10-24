//
//  IngredientsTableViewCell.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 22/10/22.
//

import UIKit

class IngredientsTableViewCell: UITableViewCell {
    static let identifier = "IngredientsTableViewCell"

    let customAccessoryType: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.backgroundColor = UIColor(named: "background")
        imageView.image = UIImage(systemName: "checkmark")
        imageView.tintColor = UIColor(named: "border")

        return imageView
    }()

    private let customBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background")
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.contentView.backgroundColor = UIColor(named: "background")
        self.selectedBackgroundView = customBackgroundView
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.accessoryView = customAccessoryType

        } else {
            self.accessoryType = .none
            self.accessoryView = UIView()
        }
    }

}
