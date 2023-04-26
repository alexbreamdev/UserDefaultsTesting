//
//  ChartView.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import SwiftUI
import Charts

struct ChartView: View {
    @EnvironmentObject var betVm: BetViewModel
    var body: some View {
        Chart {
            ForEach(betVm.bets) { bet in
                LineMark(x: .value("Team", bet.team), y: .value("Odd", bet.oddBet), series: .value("Year", "2023"))
                    .cornerRadius(10)
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(by:.value("Year", "2023"))
                    .symbol(by: .value("Year", "2023"))
            }
     
        }
        .frame(height: 300)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
            .environmentObject(BetViewModel())
    }
}
