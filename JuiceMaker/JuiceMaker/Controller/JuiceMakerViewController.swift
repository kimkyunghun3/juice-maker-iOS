//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit


class JuiceMakerViewController: UIViewController {
    
    @IBOutlet weak var strawberryQuantityLabel: UILabel!
    @IBOutlet weak var bananaQuantityLabel: UILabel!
    @IBOutlet weak var pineappleQuantityLabel: UILabel!
    @IBOutlet weak var kiwiQuantityLabel: UILabel!
    @IBOutlet weak var mangoQuantityLabel: UILabel!
    
    let juiceMaker = JuiceMaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        printStock()
    }
    
    func printStock() {
        let fruitStoreInventory = juiceMaker.fetchAllStock()
        strawberryQuantityLabel.text = String(fruitStoreInventory[.strawberry] ?? 0)
        bananaQuantityLabel.text = String(fruitStoreInventory[.banana] ?? 0)
        pineappleQuantityLabel.text = String(fruitStoreInventory[.pineapple] ?? 0)
        kiwiQuantityLabel.text = String(fruitStoreInventory[.kiwi] ?? 0)
        mangoQuantityLabel.text = String(fruitStoreInventory[.mango] ?? 0)
    }
    
    @IBAction func orderJuice(_ sender: UIButton) {
        guard let orderedJuice = JuiceMenu(rawValue: sender.tag) else {
            return
        }
        
        if juiceMaker.make(orderedJuice) {
            showSuccessAlert(menu: orderedJuice)
        } else {
            showFailureAlert()
        }
    }
    
    func showSuccessAlert(menu: JuiceMenu) {
        let alert: UIAlertController = UIAlertController(title: nil,
                                                         message: menu.koreanName + AlertMessage.makeSuccessMessage.description,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "확인",
                                                    style: .default,
                                                    handler: { (action) in
                                                                     self.printStock()
                                                    })
        alert.addAction(okAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func showFailureAlert() {
        let alert: UIAlertController = UIAlertController(title: nil,
                                                         message: AlertMessage.makeFailMessage.description,
                                                         preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "수정하기",
                                                    style: .default,
                                                    handler: { (action) in
                                                                   self.changeSceneOfManageStockViewController()
                                                    })
        let cancelAction: UIAlertAction = UIAlertAction(title: "나중에 하기",
                                                        style: .default,
                                                        handler: { (action) in
                                                                       self.printStock()
                                                        })
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        present(alert,
                animated: true,
                completion: nil)
    }
    
    func changeSceneOfManageStockViewController() {
        guard let manageStockViewController = self.storyboard?.instantiateViewController(identifier: "manageStock") else {
            return
        }
        self.present(manageStockViewController, animated: true)
    }
}
