//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits = [FruitTypes: Int]()
    
    init() {
        for fruit in fruits {
            fruits[fruit.key] = 10
        }
    }
    
    func consumeFruit(recipe: [FruitTypes:Int]) throws -> [FruitTypes: Int] {
        
        for (fruit, fruitCount) in recipe {
            guard let stock = fruits[fruit], stock >= fruitCount else {
                throw JuiceMakerError.outOfStock
            }
            fruits[fruit] = stock - fruitCount
        }
        return fruits
    }
}
