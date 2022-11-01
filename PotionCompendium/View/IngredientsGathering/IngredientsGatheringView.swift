//
//  IngredientsGatheringView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit

class IngredientsGatheringView: UIView {
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!

//    var fallenIngredientsCounter = 0

    let appUI = AppUI.shared

    lazy var basket: UIImageView = {
        let image = UIImageView(frame: CGRect(
            x: self.bounds.midX - 50,
            y: self.bounds.maxY - 150,
            width: 100,
            height: 100))
        image.image = UIImage(named: "basket")
        return image
    }()

    let backgroundView = BackgroundView()
    lazy var startingMesage = StartingMessageView()

    var isGameOver: Bool = false {
        didSet {
            if isGameOver == false {
                setTimer()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(pannedView))
        basket.addGestureRecognizer(panGesture)
        basket.isUserInteractionEnabled = true

        self.startingMesage.startButton.addTarget(
            self,
            action: #selector(startGathering),
            for: .touchUpInside)

        self.backgroundView.image = UIImage(named: "forest_at_night")
        self.addSubview(backgroundView)
        self.addSubview(appUI)
        self.addSubview(basket)

        animator = UIDynamicAnimator(referenceView: self)
        gravity = UIGravityBehavior(items: [])
        collision = UICollisionBehavior(items: [])
        addGravityBehavior()
        addCollisionBehavior()
        self.addSubview(startingMesage)

        setConstraints()
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            startingMesage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            startingMesage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            startingMesage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            startingMesage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65)
        ])
    }

    @objc
    func startGathering() {
        self.startingMesage.removeFromSuperview()
        self.isGameOver = false
    }

    func getSecondsAsMinutesAndSeconds(_ seconds: Double) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad

        let formattedString = formatter.string(from: TimeInterval(seconds))
        return formattedString
    }

    func setTimer() {
        let dropIngredients = dropIngredients()
        _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.isGameOver {
                dropIngredients.invalidate()
                timer.invalidate()
            }
        }

    }

    func dropIngredients() -> Timer {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.45, repeats: true) { _ in
            let ingredient = self.newIngredient()
            self.collision.addItem(ingredient)
            self.gravity.addItem(ingredient)
        }

        return timer
    }

    func addGravityBehavior() {
        let direction = CGVector(dx: 0, dy: 1)
        gravity.gravityDirection = direction
        gravity.magnitude = 0.25
        animator.addBehavior(gravity)
    }

    func addCollisionBehavior() {
        collision.addBoundary(withIdentifier: "basket" as NSString, for: UIBezierPath(rect: basket.frame))
        animator.addBehavior(collision)
    }

    func newIngredient() -> UIImageView {
        let isSpoiled = Float.random(in: 0...1) > 0.7 ? true : false
        let frame  = CGRect(
            x: Int.random(in: 0..<350),
            y: -20,
            width: 35,
            height: 35)

        let ingredientIcon = isSpoiled ? SpoiledIngredient(frame: frame) : IngredientIcon(frame: frame)

        ingredientIcon.image = UIImage(named: "ingredient-\(Int.random(in: 1...8))")

        if isSpoiled {
            ingredientIcon.layer.shadowColor = UIColor.green.cgColor
            ingredientIcon.layer.shadowOpacity = 1
            ingredientIcon.layer.shadowRadius = 10
        }

        self.addSubview(ingredientIcon)
        self.sendSubviewToBack(ingredientIcon)
        self.sendSubviewToBack(backgroundView)

        return ingredientIcon
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func pannedView(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            animator.removeBehavior(collision)
            let translation = recognizer.translation(in: self)
            basket.center = CGPoint(
                x: basket.center.x + translation.x,
                y: basket.center.y)
            recognizer.setTranslation(.zero, in: self)
            self.addCollisionBehavior()
        default:
            break
        }
    }
}
