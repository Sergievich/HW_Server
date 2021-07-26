//
//  UsersVC.swift
//  NetClassWork
//
//  Created by Martynov Evgeny on 22.07.21.
//

import UIKit

class UsersVC: UITableViewController {
    
    // MARK: Private

    private let jsonUrl = "https://jsonplaceholder.typicode.com/users"

    static var users: [User] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // fetchData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        UsersVC.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        let user = UsersVC.users[indexPath.row]
        cell.configure(with: user)
        return cell
    }

    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                UsersVC.users = try JSONDecoder().decode([User].self, from: data)
                print(UsersVC.users)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Privet" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }

        let FullInformatiomnVC = segue.destination as! FullInformationVC
        FullInformatiomnVC.index = indexPath.row
    }
   
}
