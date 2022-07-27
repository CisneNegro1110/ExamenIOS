//
//  ExamenIOSApp.swift
//  Shared
//
//  Created by Jesús Francisco Leyva Juárez on 21/07/22.
//

import SwiftUI
import Firebase

@main
struct ExamenIOSApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            principalView()
           // ContentView()
        }
    }
}
