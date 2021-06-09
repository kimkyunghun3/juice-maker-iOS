//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    let fruitStore: [FruitStore] = [
        StrawberryStock(),
        BananaStock(),
        PineappleStock(),
        KiwiStock(),
        MangoStock()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fruitStore.forEach(({$0.amount}))
    }


}

