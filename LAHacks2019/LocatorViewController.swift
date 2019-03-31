//
//  LocatorViewController.swift
//  LAHacks2019
//
//  Created by Chris Rodriguez on 3/30/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import MapKit
import Firebase

class LocatorViewController: UIViewController, CLLocationManagerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var listItems: [Vehicle] = [Vehicle]()
    let locationManager = CLLocationManager()
  
    
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var vehiclePicker: UIPickerView!
    @IBOutlet weak var lockUnlockLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Database.database().reference().child("Users/\(Auth.auth().currentUser!.uid)/Vehicles").observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let childSnapshot = child as! DataSnapshot
                self.listItems.append(Vehicle(snapshot: childSnapshot))
            }
            self.vehiclePicker.reloadAllComponents();
            if self.listItems.count > 0 {
                if self.listItems[0].locked == 0 {
                    self.lockUnlockLabel.text = "Locked"
                    self.switchOutlet.isOn = true
                } else {
                    self.lockUnlockLabel.text = "Unlocked"
                    self.switchOutlet.isOn = false
                }
            } else {
                self.vehiclePicker.isUserInteractionEnabled = false
                self.switchOutlet.isUserInteractionEnabled = false
            }
        }
        
        self.vehiclePicker.delegate = self
        self.vehiclePicker.dataSource = self
    }
    @IBAction func navigateBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func lockUnlockSwitch(_ sender: Any) {
        if lockUnlockLabel.text == "Unlocked" {
            lockUnlockLabel.text = "Locked"
            if listItems.count > 0 {
                listItems[vehiclePicker.selectedRow(inComponent: 0)].ref.child("locked").setValue(0)
            }
        } else {
            lockUnlockLabel.text = "Unlocked"
            if listItems.count > 0 {
                listItems[vehiclePicker.selectedRow(inComponent: 0)].ref.child("locked").setValue(1)
            }
        }
    }
    
    @IBAction func locate(_ sender: Any) {
        // If no location services are enabled, prompt user to enable it.
        if !CLLocationManager.locationServicesEnabled() {
            print("No services enabled")
            return
        }
    
        // If user still did not enable location services, skip following loop.
        if CLLocationManager.locationServicesEnabled() {
          print("User accepted")
          locationManager.requestAlwaysAuthorization()
          locationManager.delegate = self
          locationManager.desiredAccuracy = kCLLocationAccuracyBest
          locationManager.startUpdatingLocation()
          
          map.showsUserLocation = true
        }
    }
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        manager.stopUpdatingLocation()
        
        let coordinations = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinations, span: span)
        
        map.setRegion(region, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listItems.count
    }
  
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listItems[row].name + ": " + listItems[row].type
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if listItems.count > 0 {
            if listItems[row].locked == 0 {
                lockUnlockLabel.text = "Locked"
                switchOutlet.isOn = true
            } else {
                lockUnlockLabel.text = "Unlocked"
                switchOutlet.isOn = false
            }
        }
    }
}
