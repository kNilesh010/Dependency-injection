//
//  ViewController.swift
//  Dependency-injections
//
//  Created by Nilesh Kumar on 10/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [emailAccount]()
    
    private let table: UITableView = {
        let table = UITableView()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
        self.data = emailaccounts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.frame
    }
    
    private func emailaccounts() -> [emailAccount]{
        return [Gamil(), ProtonMail(), Outlook()]
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let model = data[indexPath.row]
        cell.textLabel?.text = model.domain
        return cell
    }
}

protocol emailAccount{
    var username: String {get}
    var domain: String {get}
    var receivedDate: Date {get}
}

class Gamil: emailAccount{
    
    var username: String {
        return "Nilesh"
    }
    
    var domain: String {
        return "nilesh.com"
    }
    
    var receivedDate: Date {
        return Date()
    }
    
    
}

class ProtonMail: emailAccount {
    
    var username: String {
        return "Nilesh"
    }
    
    var domain: String {
        return "protonmail.com"
    }
    
    var receivedDate: Date {
        return Date()
    }
}

class Outlook: emailAccount {
    
    var username: String {
        return "Nilesh"
    }
    
    var domain: String {
        return "outlook.com"
    }
    
    var receivedDate: Date {
        return Date()
    }
}
