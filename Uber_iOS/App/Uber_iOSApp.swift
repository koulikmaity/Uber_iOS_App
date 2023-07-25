//
//  Uber_iOSApp.swift
//  Uber_iOS
//
//  Created by Koulik Maity on 08/07/23.
//

import SwiftUI

@main
struct Uber_iOSApp: App {
    @StateObject var locationViewModel = LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
