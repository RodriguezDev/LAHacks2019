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
        
        currentUser = Auth.auth().currentUser!
        vehicles = ["Automobile", "Boat", "Bicycle", "Motorcycle", "ATV"]
    }
    @IBAction func navigateBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveVehicle(_ sender: Any) {
        let name = nameTextField.text!
        let serial = serialTextField.text!
        let color = colorTextField.text!
        let value = valueTextField.text!
        let type = self.pickerView(self.vehiclePickerView, titleForRow: self.vehiclePickerView.selectedRow(inComponent: 0), forComponent: 0) as! String

        if name.count > 0 && serial.count > 0 && color.count > 0 && value.count > 0 {
            
            Database.database().reference().child("Users/\(currentUser.uid)/Vehicles").childByAutoId().setValue(["vehicleName": name, "serial": serial, "color": color, "value": value, "type": type, "lat": 1, "lon": 1, "locked": 0])
            dismiss(animated: true, completion: nil)
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
}
