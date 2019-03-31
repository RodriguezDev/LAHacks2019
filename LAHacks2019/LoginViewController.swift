//
//  LoginViewController.swift
//  LAHacks2019
//
//  Created by Kizar Cassiere on 3/31/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var pswd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                print("User \(user.email!) logged in.")
                self.performSegue(withIdentifier: "loggedIn", sender: self)
            } else {
                print("No user logged in.")
            }
        }
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: userName.text!, password:  pswd.text!) { [weak self] user, error in
            guard self != nil else { return }
            
            if error == nil {
                self!.performSegue(withIdentifier: "loggedIn", sender: nil)
            }
            
        }
    }
}
