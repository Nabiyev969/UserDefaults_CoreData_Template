//
//  PersistenceController.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 11.01.26.
//

import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Habits")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("CoreData error: \(error)")
            }
        }
    }
    
}
