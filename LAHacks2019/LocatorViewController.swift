//
//  LocatorViewController.swift
//  LAHacks2019
//
//  Created by Chris Rodriguez on 3/30/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import MapKit

class LocatorViewController: UIViewController {
    
    @IBOutlet weak var lockUnlockLabel: UILabel!
    
    @IBOutlet weak var Map: MKMapView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func lockUnlockSwitch(_ sender: Any) {
        lockUnlockLabel.text = "Hello there"
    }
    
    @IBAction func Locate(_ sender: Any) {
        
        
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
