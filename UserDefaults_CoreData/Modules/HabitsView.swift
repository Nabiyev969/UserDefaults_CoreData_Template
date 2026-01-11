//
//  HabitsView.swift
//  UserDefaults_CoreData
//
//  Created by Nabiyev Anar on 08.01.26.
//

import UIKit
import SnapKit

class HabitsView: UIViewController {
    
    let viewModel = HabitsViewModel()
    
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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddHabit))
        
        setupUI()
        setupBinding()
        viewModel.fetchHabits()
    }
    
    private func setupUI() {
        view.addSubview(loginButton)
        view.addSubview(habitTableView)

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(44)
            make.width.equalTo(120)
        }

        habitTableView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupBinding() {
        viewModel.onHabitsUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.habitTableView.reloadData()
            }
        }
    }
    
    @objc
    private func didTapLogin() {
        UserDefaultsManager.shared.isLoggedIn = true
        print(UserDefaultsManager.shared.isLoggedIn)
    }
    
    @objc
    private func didTapAddHabit() {
        viewModel.addHabit(title: "Habit \(viewModel.habits.count + 1)")
    }
    
}

extension HabitsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as? UITableViewCell {
            cell.textLabel?.text = viewModel.habits[indexPath.row].title
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
