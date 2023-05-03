//
//  BetViewModel.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import Foundation
import Combine

class BetViewModel: ObservableObject {
    
    @Published var bets: [BetModel] = []
    @Published var winCount: Int = 0
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        getBets()
        
        $bets
            .map { bet in
                   bet.filter { element in
                       element.win == true
                   }
                }
            .sink {[weak self ] value in
                self?.winCount = value.count
            }
            .store(in: &subscriptions)
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
