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
    @State var showCardio = false
    @State var showStrength = false
    @State var showFlexibility = false
    @State var cardioExercises : [cardio] = []
    var cardioTest = ["Running", "Walking","Football"]
   @State var strengthTest = ["Bicep Curl","Bench Press", "Chest Fly"]
    var flexibilityTest = ["Lunges","Touch Toes","Plank"]
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State var showStartDates = false
    @State var showEndDates = false
    @ObservedObject var d = db()
  
    
    
    
    var body: some View {
       // NavigationView {
        VStack {
            Form {
                Section(header:Text("Name of Workout")){
                    TextField("Enter Name of Workout", text: $nameOfWorkout)
                    
                }
                Section(header:Text("Description of Workout")){
                    TextField("Enter Description of Workout", text: $description)
                    
                }
                
                Section(header:Text("Exercises")) {
                    
                    Toggle(isOn: $showCardio) {
                        Text("Add Cardio Exercises?")
                        
                        }
                    if showCardio {
                        NavigationLink(destination: CardioList()) {
                            Text("Select Cardio Exercises")
                        } .buttonStyle(PlainButtonStyle()).foregroundColor(.blue)
                        List{
                            ForEach(db.sharedInstance.cardioForWorkout) { exercise in
                                Text("\(exercise.name)")
                        }
                        }
                            
                        
                    }
                    
                    Toggle(isOn: $showStrength) {
                        Text("Add Strength Exercises?")
                        
                        }
                    if showStrength {
                        NavigationLink(destination: StrengthList()) {
                        Text("Select Strength Exercises")
                    } .buttonStyle(PlainButtonStyle()).foregroundColor(.blue)
                    List{
                        
                        ForEach(db.sharedInstance.strengthForWorkout) { exercise in
                        Text("\(exercise.name)")
                        
                }
                        
        }
                        
                        
                        
                        
                        

                    
                }
                    
                    Toggle(isOn: $showFlexibility) {
                        Text("Add Flexibility Exercises?")
                        
                    }
                    if showFlexibility {
                        NavigationLink(destination: FlexibilityList()) {
                            Text("Select Flexibility Exercises")
                            } .buttonStyle(PlainButtonStyle()).foregroundColor(.blue)
                    
                    List{
                        ForEach(db.sharedInstance.flexibilityForWorkout) { exercise in
                       Text("\(exercise.name)")
                        
                            }
                        
                        
                        
                        
                        }
                        }
                    
                    
                   
            
            
            
        
                    
                }
                
                Section(header: Text("Dates")){
                    NavigationLink(destination: DayPicker()) {
                        
                        
                    Text("Select Days To Repeat Workout")
                    } .buttonStyle(PlainButtonStyle()).foregroundColor(.blue)
                    
                    
                    
                    
                    
                    
                    Toggle(isOn: $showStartDates) {
                    Text("Add Start Date?")
                    }
                    if showStartDates {
                    
                    DatePicker("Enter Start Date", selection: $startDate)
                        .frame(maxHeight: 400)
                       
                        Toggle(isOn: $showEndDates) {
                                           Text("Add End Date?")
                                           }
                                           if showEndDates {
                                           
                                           DatePicker("Enter End Date", selection: $endDate)
                                               .frame(maxHeight: 400)
                        }
                        
                        
                }
                }
                    
                    
            .navigationBarTitle("Create Workout")
                
                .onAppear(){
                    
                    
                    for i in db.sharedInstance.daysRepeated {
                        print(i)
                    }
                    
                    for i in self.d.cardioForWorkout {
                        print(i.name)
                        print(i.id)
                    }
                    
                print("APPEAR")
                for i in db.sharedInstance.strengthList {
                    print(i.name)
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
