//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var Fruits = [FruitTypes: Int]()
    
    init() {
        for fruit in Fruits {
            Fruits[fruit.key] = 10
        }
    }
}
