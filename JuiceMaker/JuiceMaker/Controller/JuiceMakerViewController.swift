//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class JuiceMakerViewController: UIViewController {   
    private var fruitStore: FruitStore?
    private var juiceMaker: JuiceMaker?
    
    @IBOutlet weak var strawberryAmountLabel: UILabel!
    @IBOutlet weak var bananaAmountLabel: UILabel!
    @IBOutlet weak var pineappleAmountLabel: UILabel!
    @IBOutlet weak var kiwiAmountLabel: UILabel!
    @IBOutlet weak var mangoAmountLabel: UILabel!
    
    @IBOutlet weak var strawberryBananaJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoKiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var strawberryJucieOrderButton: UIButton!
    @IBOutlet weak var bananaJuiceOrderButton: UIButton!
    @IBOutlet weak var pineappleJuiceOrderButton: UIButton!
    @IBOutlet weak var kiwiJuiceOrderButton: UIButton!
    @IBOutlet weak var mangoJuiceOrderButton: UIButton!
    
    @IBAction func touchUpJuiceOrderButton(_ sender: UIButton) {
        do {
            let order = try takeOrder(sender: sender)
            try juiceMaker?.produce(juice: order)
            try configureLabels()
            alert(menu: order)
        } catch {
            alertError()
        }
    }
    
    static func instance(juiceMaker: JuiceMaker, fruitStore: FruitStore) -> JuiceMakerViewController {
        let storyborad = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyborad.instantiateViewController(withIdentifier: "JuiceMakerViewController") as! JuiceMakerViewController
        viewController.juiceMaker = juiceMaker
        viewController.fruitStore = fruitStore
        return viewController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            try configureLabels()
        } catch {
            // alertError(error)
        }
    }
    
    private func configureLabels() throws {
        let labels: [UILabel] = [strawberryAmountLabel, bananaAmountLabel, pineappleAmountLabel, kiwiAmountLabel, mangoAmountLabel]
        let fruits: [Fruit] = Fruit.allCases
        var currentIndex = labels.startIndex
        
        try fruits.forEach { fruit in
            let currentLabel = labels[currentIndex]
            
            guard let fruitAmount = fruitStore?.stocks[fruit] else {
                throw JuiceMakerError.notFoundFruit
            }

            currentLabel.text = String(fruitAmount)
            currentIndex = labels.index(after: currentIndex)
        }
    }
    
    private func takeOrder(sender: UIButton) throws -> JuiceMaker.Menu {
        switch sender {
        case strawberryBananaJuiceOrderButton:
            return .strawberryBanana
        case mangoKiwiJuiceOrderButton:
            return .mangoKiwi
        case strawberryJucieOrderButton:
            return .strawberry
        case bananaJuiceOrderButton:
            return .banana
        case pineappleJuiceOrderButton:
            return .pineapple
        case kiwiJuiceOrderButton:
            return .kiwi
        case mangoJuiceOrderButton:
            return .mango
        default:
            throw JuiceMakerError.notFoundMenu
        }
    }
    
    private func alert(menu: JuiceMaker.Menu) {
        let message = menu.rawValue + "쥬스 나왔습니다! 맛있게 드세요!"
        showAlert(title: message, confirmTitle: "확인")
    }
    
    private func alertError() {
        let message = "재료가 모자라요. 재고를 수정할까요?"
        showAlert(title: message, confirmTitle: "확인", cancelTitle: "취소", confirmHandler: presentModifyingStockViewController)
    }
    
    private func presentModifyingStockViewController() {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ModifyingStockViewController") else {
            return
        }
        nextVC.modalTransitionStyle = .coverVertical
        self.present(nextVC, animated: true)
    }
}

extension UIViewController {
    func showAlert(title: String?,
               confirmTitle: String?,
               message: String? = nil,
               cancelTitle: String? = nil,
               confirmHandler: (() -> Void)? = nil,
               cancelHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let cancelTitle = cancelTitle {
            let cancelButton = UIAlertAction(title: cancelTitle, style: .destructive, handler: { _ in cancelHandler?()
            })
            alert.addAction(cancelButton)
        }
        
        let confirmButton = UIAlertAction(title: confirmTitle, style: .default, handler: { _ in
            confirmHandler?()
        })
        
        alert.addAction(confirmButton)
        
        self.present(alert, animated: false)
    }
}

