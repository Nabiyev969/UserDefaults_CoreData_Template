//
//  HabitsViewModel.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 10.01.26.
//

import Foundation

final class HabitsViewModel {
    
    private let coreData = CoreDataManager.shared
    private(set) var habits: [Habit] = []
    
    var onHabitsUpdated: (() -> ())?
    
    func fetchHabits() {
        habits = coreData.fetchHabits()
        onHabitsUpdated?()
    }
    
    func addHabit(title: String) {
        coreData.addHabit(title: title)
        fetchHabits()
    }
}
