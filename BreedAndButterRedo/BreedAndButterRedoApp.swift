//
//  BreedAndButterRedoApp.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//

import SwiftUI

@main
struct BreedAndButterRedoApp: App {
    @StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
