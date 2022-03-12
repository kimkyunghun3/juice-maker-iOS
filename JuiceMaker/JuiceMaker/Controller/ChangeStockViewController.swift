//
//  ChangeStockViewController.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/03/03.
//

import UIKit

class ChangeStockViewController: UIViewController {
    var fruitsStore = FruitStore()
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bannaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var strawberryStockStepper: UIStepper!
    @IBOutlet weak var bannaStockStepper: UIStepper!
    @IBOutlet weak var pineappleStockStepper: UIStepper!
    @IBOutlet weak var kiwiStockStepper: UIStepper!
    @IBOutlet weak var mangoStockStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showFruitsStock()
    }
    
    func showFruitsStock() {
        let notFoundFruitCount = 0
        for fruits in fruitsStore.fruits.keys {
            switch fruits {
            case .strawberry:
                strawberryStockLabel.text = fruitsStore.fruits[.strawberry]?.description
                strawberryStockStepper.value = Double(fruitsStore.fruits[.strawberry] ?? notFoundFruitCount)
            case .banana:
                bannaStockLabel.text = fruitsStore.fruits[.banana]?.description
                bannaStockStepper.value = Double(fruitsStore.fruits[.banana] ?? notFoundFruitCount)
            case .mango:
                mangoStockLabel.text = fruitsStore.fruits[.mango]?.description
                mangoStockStepper.value = Double(fruitsStore.fruits[.mango] ?? notFoundFruitCount)
            case .kiwi:
                kiwiStockLabel.text = fruitsStore.fruits[.kiwi]?.description
                kiwiStockStepper.value = Double(fruitsStore.fruits[.kiwi] ?? notFoundFruitCount)
            case .pineapple:
                pineappleStockLabel.text = fruitsStore.fruits[.pineapple]?.description
                pineappleStockStepper.value = Double(fruitsStore.fruits[.pineapple] ?? notFoundFruitCount)
            }
        }
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        switch sender{
        case strawberryStockStepper:
            fruitsStore.fruits[.strawberry] = Int(sender.value)
            strawberryStockLabel.text = String(Int(sender.value))
        case bannaStockStepper:
            fruitsStore.fruits[.banana] = Int(sender.value)
            bannaStockLabel.text = String(Int(sender.value))
        case pineappleStockStepper:
            fruitsStore.fruits[.pineapple] = Int(sender.value)
            pineappleStockLabel.text = String(Int(sender.value))
        case kiwiStockStepper:
            fruitsStore.fruits[.kiwi] = Int(sender.value)
            kiwiStockLabel.text = String(Int(sender.value))
        case mangoStockStepper:
            fruitsStore.fruits[.mango] = Int(sender.value)
            mangoStockLabel.text = String(Int(sender.value))
        default:
            JuiceMakerError.stepperError
        }
    }
    
    @IBAction func updateFruitStockButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
