//
//  JuiceTypes.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/04/05.
//

import Foundation

enum JuiceTypes {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
    
    func recipe() -> [FruitTypes:Int] {
        switch self {
        case .strawberryJuice:
            return [FruitTypes.starwberry: 16]
        case .bananaJuice:
            return [FruitTypes.banana: 2]
        case .kiwiJuice:
            return [FruitTypes.kiwi: 3]
        case .pineappleJuice:
            return [FruitTypes.pineapple: 2]
        case .strawberryBananaJuice:
            return [FruitTypes.starwberry: 10, FruitTypes.banana: 1]
        case .mangoJuice:
            return [FruitTypes.mango: 3]
        case .mangoKiwiJuice:
            return [FruitTypes.mango: 2, FruitTypes.kiwi: 1]
        }
    }
}
