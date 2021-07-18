//
//  BooksTableViewController.swift
//  loginApp
//
//  Created by slava on 18.07.2021.
//

import UIKit

class BooksTableViewController: UITableViewController {

    private var currentUser = User.getAdminUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return currentUser.favouriteBooks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {return UITableViewCell()}
        let favouriteBook = currentUser.favouriteBooks[indexPath.row]
        if favouriteBook.title.count > 15 {
            print("get title count")
            cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size: 15)
        }
        cell.textLabel?.text = "\(favouriteBook.author) \(favouriteBook.title)"
        return cell
    }
}
