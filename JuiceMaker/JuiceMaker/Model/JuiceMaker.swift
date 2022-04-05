//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {

    func makeJuice(juice: JuiceTypes, fruitStore: FruitStore) -> [FruitTypes:Int] {
        var fruitStock = [FruitTypes:Int]()
        do {
            fruitStock = try fruitStore.consumeFruit(recipe: juice.recipe())
        } catch JuiceMakerError.outOfStock {
        } catch {
        }
        return fruitStock
    }
}
