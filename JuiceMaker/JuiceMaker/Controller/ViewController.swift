//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    var fruitStore = FruitStore()
    var fruitInitStock = "10"
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    @IBOutlet weak var bananaStockLabel: UILabel!
    @IBOutlet weak var pineappleStockLabel: UILabel!
    @IBOutlet weak var kiwiStockLabel: UILabel!
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initFruits()
    }
    
    @IBAction func touchedChangeStockButton(_ sender: Any) {
        self.performSegue(withIdentifier: "showFruitsStockSegue", sender: self)
    }
    
    @IBAction func touchedOrderJuiceButton(_ sender: UIButton) {
    
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

