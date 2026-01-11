//
//  Habit+CoreDataProperties.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 11.01.26.
//
//

public import Foundation
public import CoreData


public typealias HabitCoreDataPropertiesSet = NSSet

extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var title: String?

}

extension Habit : Identifiable {

}
