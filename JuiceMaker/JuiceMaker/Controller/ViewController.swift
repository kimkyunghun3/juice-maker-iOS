//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var fruitStore = FruitStore()
    var orderJuice = JuiceMaker()
    var fruitInitStock = "10"
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    @IBOutlet weak var orderedStrawberryBananaLabel: UIButton!
    @IBOutlet weak var orderedMangoKiwiLabel: UIButton!
    @IBOutlet weak var orderedStrawberryLabel: UIButton!
    @IBOutlet weak var orderedBananaLabel: UIButton!
    @IBOutlet weak var orderedPineappleLabel: UIButton!
    @IBOutlet weak var orderedKiwiLabel: UIButton!
    @IBOutlet weak var orderedMangoLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruits()
    }
    
    @IBAction func touchedChangeStockButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showFruitsStockSegue", sender: self)
    }
    
    @IBAction func orderJuiceButtonTapped(_ sender: UIButton) throws {
        let defaultCount = 0
        switch sender {
        case orderedStrawberryBananaLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.strawberryBananaJuice, fruitStore: fruitStore)
            strawberryStockLabel.text = String(fruitCount[.starwberry] ?? defaultCount)
            bananaStockLabel.text = String(fruitCount[.banana] ?? defaultCount)
        case orderedMangoKiwiLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.mangoKiwiJuice, fruitStore: fruitStore)
            mangoStockLabel.text = String(fruitCount[.mango] ?? defaultCount)
            kiwiStockLabel.text = String(fruitCount[.kiwi] ?? defaultCount)
        case orderedStrawberryLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.strawberryJuice, fruitStore: fruitStore)
            strawberryStockLabel.text = String(fruitCount[.starwberry] ?? defaultCount)
        case orderedBananaLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.bananaJuice, fruitStore: fruitStore)
            bananaStockLabel.text = String(fruitCount[.banana] ?? defaultCount)
        case orderedPineappleLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.pineappleJuice, fruitStore: fruitStore)
            pineappleStockLabel.text = String(fruitCount[.pineapple] ?? defaultCount)
        case orderedKiwiLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.kiwiJuice, fruitStore: fruitStore)
            kiwiStockLabel.text = String(fruitCount[.kiwi] ?? defaultCount)
        case orderedMangoLabel:
            let fruitCount = orderJuice.makeJuice(juice: JuiceTypes.mangoJuice, fruitStore: fruitStore)
            mangoStockLabel.text = String(fruitCount[.mango] ?? defaultCount)
        default:
            throw JuiceMakerError.unexpectedError
        }
    }
    
    func initFruits() {
        strawberryStockLabel.text = fruitInitStock
        bananaStockLabel.text = fruitInitStock
        pineappleStockLabel.text = fruitInitStock
        kiwiStockLabel.text = fruitInitStock
        mangoStockLabel.text = fruitInitStock
    }
    
    func showJuiceAlert() {
        let alert = UIAlertController(title: "성공", message: "쥬스 제조 후 쥬스 나왔습니다! 맛있게 드세요!", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "닫기", style: .default)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    func showOutOfStockAlert() {
        let alert = UIAlertController(title: "재고 부족!", message: "재료가 모자라요. 재고를 수정할까요?", preferredStyle: .alert)
        let noButton = UIAlertAction(title: "아니오", style: .default)
        let yesButton = UIAlertAction(title: "예", style: .default) { (action) in
            self.performSegue(withIdentifier: "showFruitsStockSegue", sender: self)
        }
        alert.addAction(yesButton)
        alert.addAction(noButton)
        present(alert, animated: true)
    }
}
