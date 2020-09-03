//
//  CreateWorkoutView.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 01/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct CreateWorkoutView: View {
    //Variables for workout
    @State var nameOfWorkout = ""
    @State var description = ""
    
    
    
    
    var body: some View {
        NavigationView {
        VStack {
            Form {
                Section(header:Text("Name of Workout")){
                    TextField("Enter Name of Workout", text: $nameOfWorkout)
                    
                }
                Section(header:Text("Description of Workout")){
                    TextField("Enter Description of Workout", text: $description)
                    
                }
            }
            
            
        
            }
            
        }
        
    }
}

struct CreateWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        CreateWorkoutView()
    }
}
