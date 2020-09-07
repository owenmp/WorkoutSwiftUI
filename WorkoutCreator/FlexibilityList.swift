//
//  FlexibilityList.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 07/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct FlexibilityList: View {
    
    var flexibilityExercises = db.sharedInstance.flexibilityList
    @ObservedObject var d = db()
    
    var body: some View {
       // NavigationView {
            
            List(flexibilityExercises) { flexibility in
                VStack {
                    Text (flexibility.name)
                    
                    HStack {
                        Text(flexibility.description)
                        
                        Button("Add") {
                            db.sharedInstance.flexibilityForWorkout.append(flexibility)
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                
                
                
            
        
        
        
        }.navigationBarTitle("Flexibility Exercises")
    }
}

struct FlexibilityList_Previews: PreviewProvider {
    static var previews: some View {
        FlexibilityList()
    }
}
