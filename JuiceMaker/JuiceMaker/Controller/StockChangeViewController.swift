//
//  StockChangeViewController.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/06/15.
//

import UIKit

class StockChangeViewController: UIViewController {
    @IBOutlet private var stockLabels: [StockLabel]!
    private let juiceMaker = JuiceMaker.juiceMaker
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
    }
    
    @IBAction private func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateLabel() {
        StockLabel.update(numbers: stockLabels, of: juiceMaker.fruitStore)
    }
    
}