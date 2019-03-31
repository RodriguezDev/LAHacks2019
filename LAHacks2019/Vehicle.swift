//
//  Vehicle.swift
//  LAHacks2019
//
//  Created by Chris Rodriguez on 3/30/19.
//  Copyright © 2019 Chris. All rights reserved.
//

import Foundation
import Firebase

class Vehicle {
    
    let name: String
    let serial: String
    let color: String
    let val: String
    let type: String
    let lon: Int
    let lat: Int
    let locked: Int
    let ref: DatabaseReference
    
    init(newName: String, newSerial: String, newColor: String, newValue: String, newType: String, newLon: Int, newLat: Int, newLock: Int) {
        name = newName
        serial = newSerial
        color = newColor
        val = newValue
        type = newType
        lon = newLon
        lat = newLat
        locked = newLock
        ref = Database.database().reference()
    }
    init(snapshot: DataSnapshot) {
        ref = snapshot.ref
        let value = snapshot.value as! [String: Any]
        
        name = value["vehicleName"] as! String
        serial = value["serial"] as! String
        color = value["color"] as! String
        val = value["value"] as! String
        type = value["type"] as! String
        lon = value["lon"] as! Int
        lat = value["lat"] as! Int
        locked = value["locked"] as! Int
    }
}
