//
//  HabitsView.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 08.01.26.
//

import UIKit
import SnapKit

class HabitsView: UIViewController {
    
    var habits: [HabitModel] = [
        .init(title: "Drink water"),
        .init(title: "Reading 20 min"),
        .init(title: "Run 10 km")
    ]
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var habitTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "habitCell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Habits"
        print(UserDefaultsManager.shared.isLoggedIn)
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(loginButton)
        view.addSubview(habitTableView)
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
        }
        
        habitTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc
    private func didTapLogin() {
        UserDefaultsManager.shared.isLoggedIn = true
        print(UserDefaultsManager.shared.isLoggedIn)
    }
    
}

extension HabitsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as? UITableViewCell {
            cell.textLabel?.text = habits[indexPath.row].title
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
