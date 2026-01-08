//
//  HabitsView.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 08.01.26.
//

import UIKit
import SnapKit

class HabitsView: UIViewController {
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(UserDefaultsManager.shared.isLoggedIn)
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
    }
    
    @objc
    private func didTapLogin() {
        UserDefaultsManager.shared.isLoggedIn = true
        print(UserDefaultsManager.shared.isLoggedIn)
    }
    
}
