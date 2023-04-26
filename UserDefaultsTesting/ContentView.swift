//
//  ContentView.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var betVM: BetViewModel
    @State private var showAddList: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(betVM.bets) { bet in
                    LabeledContent(bet.team, value: "\(bet.oddBet)")
                }
                .onDelete(perform: betVM.deleteBet)
            }
            .navigationTitle("Bet List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddList.toggle()
                    } label: {
                        Text("Add")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        ChartView()
                    } label: {
                        Text("Go to charts")
                    }

                    
                }
            }
            .sheet(isPresented: $showAddList) {
                AddBetView()
                    .environmentObject(betVM)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BetViewModel())
    }
}
