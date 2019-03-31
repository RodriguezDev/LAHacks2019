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
    let value: String
    
    init(newName: String, newSerial: String, newColor: String, newValue: String) {
        name = newName
        serial = newSerial
        color = newColor
        value = newValue
    }
}
