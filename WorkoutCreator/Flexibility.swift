//
//  Flexibility.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 26/08/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation


class Flexibility: Exercise {
    var reps: Int
    var sets: Int
    var timeHeld: Int
    var equipment: String
    
    init(rep: Int, set: Int, time: Int, name: String, equip: String, desc: String) {
        reps = rep
        sets = set
        timeHeld = time
        equipment = equip
        
        super.init(n: name, d: desc)
    }
    
    
    
}
