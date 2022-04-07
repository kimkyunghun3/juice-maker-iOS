//
//  Error.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/04/05.
//

import Foundation

enum JuiceMakerError: Error {
    static let unexpectedError = "예상치 못한 에러 발생"
    case outOfStock
}
