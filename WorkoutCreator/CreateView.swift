//
//  CreateView.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 07/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct CreateView: View {
    var body: some View {
        NavigationView {
            HStack {
                
                NavigationLink(destination: CreateWorkoutView()) {
                Text("Create Workout")
                }
                    
                    NavigationLink(destination: ContentView()) {
                    Text("Create Exercise")
                }
                
                
            }.navigationBarTitle("Planner")
        
        
        }
    
    
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
