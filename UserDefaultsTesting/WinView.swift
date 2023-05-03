//
//  WinView.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 03.05.2023.
//

import SwiftUI

struct WinView: View {
    @EnvironmentObject var betVM: BetViewModel
    var body: some View {
        HStack {
            VStack {
                Text("Number of Bets")
                Text("\(betVM.bets.count)")
            }
            
            VStack {
                Text("Count")
                Text("\(betVM.winCount)")
            }
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView()
            .environmentObject(BetViewModel())
    }
}
