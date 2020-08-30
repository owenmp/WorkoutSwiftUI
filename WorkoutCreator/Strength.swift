//
//  Strength.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 26/08/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation


class Strength: Exercise {
    var sets: Int
    var reps: Int
    var weight: Double
    var equipment: String
    
    init(set: Int, rep: Int, weights: Double, equip : String, name: String, desc: String){
    
    sets = set
    reps = rep
    weight = weights
    equipment = equip
        
    
    
    super.init(n: name, d: desc)
    }
    
}
