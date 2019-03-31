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
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: userName.text!, password:  pswd.text!) { [weak self] user, error in
            guard self != nil else { return }
            
            if error == nil {
                self!.performSegue(withIdentifier: "loggedIn", sender: nil)
            }
            
        }
    }
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
