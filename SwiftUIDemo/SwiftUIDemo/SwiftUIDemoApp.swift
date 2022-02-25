//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by Ion Jaureguialzo Sarasola on 25/2/22.
//

import SwiftUI
import Firebase

@main
struct SwiftUIDemoApp: App {

    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
