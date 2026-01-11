//
//  UserDefaultsManager.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 08.01.26.
//

import Foundation

final class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    private let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            defaults.bool(forKey: "isLoggedIn")
        }
        set {
            defaults.set(newValue, forKey: "isLoggedIn")
        }
    }
}
