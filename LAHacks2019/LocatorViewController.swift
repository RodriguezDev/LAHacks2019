//
//  LocatorViewController.swift
//  LAHacks2019
//
//  Created by Chris Rodriguez on 3/30/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import UIKit
import MapKit

class LocatorViewController: UIViewController, CLLocationManagerDelegate {
  let locationManager = CLLocationManager()
  
  @IBOutlet weak var lockUnlockLabel: UILabel!
  @IBOutlet weak var map: MKMapView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
    @IBAction func navigateBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
  @IBAction func lockUnlockSwitch(_ sender: Any) {
    if lockUnlockLabel.text == "Unlocked" {
      lockUnlockLabel.text = "Locked"
    } else {
      lockUnlockLabel.text = "Unlocked"
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
  
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
