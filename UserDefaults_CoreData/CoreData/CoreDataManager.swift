//
//  CoreDataManager.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 10.01.26.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private let context = PersistenceController.shared.container.viewContext
    
    private init() {}
    
    func fetchHabits() -> [Habit] {
        let request: NSFetchRequest<Habit> = Habit.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }
    
    func addHabit(title: String) {
        let habit = Habit(context: context)
        habit.title = title
        save()
    }
    
    func deleteHabit(_ habit: Habit) {
        context.delete(habit)
        save()
    }
    
    private func save() {
        try? context.save()
    }
}
