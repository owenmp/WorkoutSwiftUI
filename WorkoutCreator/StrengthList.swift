//
//  StrengthList.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 07/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct StrengthList: View {
    var strengthExercises = db.sharedInstance.strengthList
    
    var body: some View {
        //NavigationView {
            List(strengthExercises) { strength in
                VStack {
                    Text(strength.name)
                    HStack {
                        Text(strength.description)
                        
                        Button("Add") {
                            db.sharedInstance.strengthForWorkout.append(strength)
                        }
                    }
                    
                }
                
                
                
                
                
                
            
            
            
            
        
        
    }
        .navigationBarTitle("Strength Exercises")
    }
}

struct StrengthList_Previews: PreviewProvider {
    static var previews: some View {
        StrengthList()
    }
}
