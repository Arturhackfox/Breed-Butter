//
//  DataController.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "UserData")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Failed to load persistentStores \(error.localizedDescription)")
            }
        }
    }
}
