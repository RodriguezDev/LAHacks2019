//
//  RegisterVehicleViewController.swift
//  LAHacks2019
//
//  Created by Chris Rodriguez on 3/30/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import Firebase

class RegisterVehicleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var currentUser: User!
    
    var vehicles: [String] = [String]()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var serialTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var vehiclePickerView: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.vehiclePickerView.delegate = self
        self.vehiclePickerView.dataSource = self
        
        //currentUser = Auth.auth().currentUser!
        vehicles = ["Automobiles", "Boat", "Bicycle", "Motorcycle", "ATV"]
    }
    @IBAction func navigateBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveVehicle(_ sender: Any) {
        let name = nameTextField.text!
        let serial = serialTextField.text!
        let color = colorTextField.text!
        let value = valueTextField.text!
        
        if name.count > 0 && serial.count > 0 && color.count > 0 && value.count > 0 {
            let vehicle = Vehicle(newName: name, newSerial: serial, newColor: color, newValue: value )
            //Database.database().reference().child("Users/\(currentUser.uid)").setValue(vehicle)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vehicles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vehicles[row]
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
