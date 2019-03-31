//
//  ViewController.swift
//  LAHacks2019
//
//  Created by Chris Rodriguez on 3/30/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome back, " + (Auth.auth().currentUser?.email!)!
    }

    @IBAction func logOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }catch let e{
            print(e)
        }
    }
}
