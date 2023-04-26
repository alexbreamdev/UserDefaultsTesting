//
//  BetViewModel.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import Foundation

class BetViewModel: ObservableObject {
    
    @Published var bets: [BetModel] = []
    
    init() {
        getBets()
    }
    
    func getBets() {
        self.bets = loadBets() ?? []
    }
    
    private func saveBets() {
        if let saveData = try? JSONEncoder().encode(bets) {
            UserDefaults.standard.set(saveData, forKey: Bet.saveBet.rawValue)
        } else {
            print("Couldn't save bet")
        }
    }
    
    func addBet(bet: BetModel) {
        bets.append(bet)
        saveBets()
    }
    
    func deleteBet(at offsets: IndexSet) {
        bets.remove(atOffsets: offsets)
        saveBets()
    }
    
    private func loadBets() -> [BetModel]? {
        guard let data = UserDefaults.standard.data(forKey: Bet.saveBet.rawValue) else {
            print("Couldn't load data")
            return nil
        }
        return try? JSONDecoder().decode([BetModel].self, from: data)
    }
}
