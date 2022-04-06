//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/04/06.
//

import UIKit

class StockChangeViewController: UIViewController {
    var fruitStore = FruitStore()
    
    @IBOutlet weak var strawberryLabel: UILabel!
    @IBOutlet weak var bananaLabel: UILabel!
    @IBOutlet weak var pineappleLabel: UILabel!
    @IBOutlet weak var kiwiLabel: UILabel!
    @IBOutlet weak var mangoLabel: UILabel!
    
    @IBOutlet weak var strawberryStepper: UIStepper!
    @IBOutlet weak var bananaStepper: UIStepper!
    @IBOutlet weak var pineappleStepper: UIStepper!
    @IBOutlet weak var kiwiStepper: UIStepper!
    @IBOutlet weak var mangoStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitStock()
    }
    
    @IBAction func fruitStockUpdateButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    func showFruitStock() {
        let notFoundFruitStock = 0
        for fruit in fruitStore.fruits.keys {
            switch fruit {
            case .starwberry:
                strawberryLabel.text = String(fruitStore.fruits[.starwberry] ?? notFoundFruitStock)
                strawberryStepper.value = Double(fruitStore.fruits[.starwberry] ?? notFoundFruitStock)
            case .banana:
                bananaLabel.text = String(fruitStore.fruits[.banana] ?? notFoundFruitStock)
                strawberryStepper.value = Double(fruitStore.fruits[.banana] ?? notFoundFruitStock)
            case .pineapple:
                strawberryLabel.text = String(fruitStore.fruits[.pineapple] ?? notFoundFruitStock)
                strawberryStepper.value = Double(fruitStore.fruits[.pineapple] ?? notFoundFruitStock)
            case .kiwi:
                strawberryLabel.text = String(fruitStore.fruits[.kiwi] ?? notFoundFruitStock)
                strawberryStepper.value = Double(fruitStore.fruits[.kiwi] ?? notFoundFruitStock)
            case .mango:
                strawberryLabel.text = String(fruitStore.fruits[.mango] ?? notFoundFruitStock)
                strawberryStepper.value = Double(fruitStore.fruits[.mango] ?? notFoundFruitStock)
        }
    }
}
    
    @IBAction func fruitCountStepperPressed(_ sender: UIStepper) throws {
        switch sender {
        case strawberryStepper:
            fruitStore.fruits[.starwberry] = Int(sender.value)
            strawberryLabel.text = String(Int(sender.value))
        case bananaStepper:
            fruitStore.fruits[.banana] = Int(sender.value)
            bananaLabel.text = String(Int(sender.value))
        case pineappleStepper:
            fruitStore.fruits[.pineapple] = Int(sender.value)
            pineappleLabel.text = String(Int(sender.value))
        case kiwiStepper:
            fruitStore.fruits[.kiwi] = Int(sender.value)
            kiwiLabel.text = String(Int(sender.value))
        case mangoStepper:
            fruitStore.fruits[.mango] = Int(sender.value)
            mangoLabel.text = String(Int(sender.value))
        default:
            throw JuiceMakerError.unexpectedError
        }
    }
}
