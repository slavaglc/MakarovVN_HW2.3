//
//  WelcomeViewController.swift
//  loginApp
//
//  Created by slava on 14.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logOutTapped() {
        dismiss(animated: true)
    }
    
}
