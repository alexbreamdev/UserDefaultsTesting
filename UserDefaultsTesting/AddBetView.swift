//
//  AddBetView.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import SwiftUI

struct AddBetView: View {
    @EnvironmentObject var betVM: BetViewModel
    @Environment(\.dismiss) var dismiss
    @State private var team: String = ""
    @State private var odds: String = "0"
    var body: some View {
        VStack {
            Text("Add Bet")
                .font(.largeTitle.bold())
            
            TextField("Team Name", text: $team)
                .textFieldStyle(.roundedBorder)
            TextField("Odd", text: $odds)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.decimalPad)
            
            Button {
                addBet()
                dismiss()
            } label: {
                Text("Save Bet")
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private func addBet() {
        if !team.isEmpty {
            let bet = BetModel(team: team, oddBet: Double(odds) ?? 0.0)
            betVM.addBet(bet: bet)
        }
    }
}

struct AddBetView_Previews: PreviewProvider {
    static var previews: some View {
            AddBetView()
                .environmentObject(BetViewModel())
    }
}
