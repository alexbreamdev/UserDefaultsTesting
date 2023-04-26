//
//  UserDefaultsTestingApp.swift
//  UserDefaultsTesting
//
//  Created by Oleksii Leshchenko on 26.04.2023.
//

import SwiftUI

@main
struct UserDefaultsTestingApp: App {
    @StateObject private var betVM = BetViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(betVM)
        }
    }
}
