//
//  TeamBlockApp.swift
//  TeamBlock
//
//  Created by James Layton on 12/2/22.
//

import SwiftUI

@main
struct TeamBlockApp: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            EmployeeListView()
                .environmentObject(appState)
        }
    }
}
