//
//  BetModel.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import Foundation


struct BetModel: Identifiable, Codable {
    var id = UUID().uuidString
    var team: String
    var oddBet: Double
}

enum Bet: String {
    case saveBet
}
