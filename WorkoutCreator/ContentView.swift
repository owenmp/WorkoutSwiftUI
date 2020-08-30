//
//  ContentView.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 16/08/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    
    @State var nameOfExercise = ""
    @State var desription = ""
    @State var setNumber = 1
    @State var repNumber = 1
    @State var secondsHeld = 1
   // @State var readList : [cardio]
    
    var a = db()
    
    var exercises = ["Cardio","Strength","Flexibility"]
    var distanceMetrics = ["Miles","Kilometres","Metres", "Yards"]
    
    var weightMetrics = ["Kilograms","Lbs"]
    @State var selectedWeightMetric = 1
    @State var selectedMetric = 1
    @State var selectedExercise = 1
    @State var targetDistance = ""
    @State var targetHour = 0
    @State var targetMins = 0
    @State private var wakeUp = Date()
    @State var equipment = ""
    @State var weightForStrength = 0.0
    @State var timeHeld = ""
  // @State var h = Cardio(m: metrics.km, h: 3, min: 3, dis: 2, n: "Name", des: "as")
    
    

    var body: some View {
        
        NavigationView {
            
            VStack {
            Form {
                Section(header:Text("Name of Exercise")) {
                    TextField("Enter Name of Exercise", text: $nameOfExercise)
                    }
                Section(header:Text("Description of Exercise")) {
                    TextField("Enter Description of Exercise", text: $desription)
                }
                Section(header:Text("Type of Exercise")) {
                    Picker(selection: $selectedExercise, label: Text("Exercise")){
                        ForEach(0 ..< exercises.count) {
                            Text("\(self.exercises[$0])")
                        }
                        
                    
                        } .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Details")) {
                    if selectedExercise == 0 {
                       // Text("Cardio").font(.largeTitle)
                        Picker(selection: $selectedMetric, label: Text("Metric")){
                            ForEach(0 ..< distanceMetrics.count) {
                                Text("\(self.distanceMetrics[$0])")
                            }
                            
                        
                            } .pickerStyle(SegmentedPickerStyle())
                        
                        List {
                            Section(header:Text("Target Distance in \(distanceMetrics[selectedMetric])")) {
                        TextField("Target Distance",text: $targetDistance).keyboardType(.numberPad)
                            }
                            Section(header:Text("Target Completion Time")) {
                               // DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                                
                        //TextField("Target Time",text: $targetHour).keyboardType(.numberPad)
                                
                                Picker("Target Hour", selection: $targetHour) {
                                    ForEach(0 ..< 24) {
                                    Text("\($0) Hours")
                                    }
                                }
                                Picker("Target Minute", selection: $targetMins) {
                                    ForEach(0 ..< 60) {
                                    Text("\($0) Minutes")
                                    }
                                }
                                 TextField("Equipment Needed",text: $equipment)
                            }
                        }
                        
                        
                        
                    } else if selectedExercise == 1 {
                      //  Text("Strength")
                        Stepper(value: $setNumber, in: 1...25) {
                            
                            if setNumber == 1 {
                                Text(" 1 Set")
                            } else {
                    
                                Text("\(setNumber) Sets")
                            }
                        
                        
                        }
                        
                        Stepper(value: $repNumber, in: 1...100) {
                                
                                if repNumber == 1 {
                                    Text(" 1 Rep per set")
                                } else {
                        
                                    Text("\(repNumber) Reps per set")
                                }
                            
                            
                            }
                        
                        Picker(selection: $selectedWeightMetric, label: Text("Metric")){
                            ForEach(0 ..< weightMetrics.count) {
                            Text("\(self.weightMetrics[$0])")
                            
                            
                            
                            }
                        
                        
                        }.pickerStyle(SegmentedPickerStyle())
                        
                        
                        Stepper(value: $weightForStrength, in: 1...100, step: 0.25) {
                                
                                if weightForStrength == 1 {
                                    Text(" \(weightForStrength, specifier: "%.2f") \(weightMetrics[selectedWeightMetric])")
                                } else {
                        
                                    Text("\(weightForStrength, specifier: "%.2f")  \(weightMetrics[selectedWeightMetric])")
                                }
                        }
                        
                        
                       // TextField("Rep number per set", text: $repNumber).keyboardType(.numberPad)
                        
                    }else {
                        
                        Stepper(value: $setNumber, in: 1...25) {
                                
                                if setNumber == 1 {
                                    Text(" 1 Set")
                                } else {
                        
                                    Text("\(setNumber) Sets")
                                }
                            
                            
                            }
                            
                            Stepper(value: $repNumber, in: 1...100) {
                                    
                                    if repNumber == 1 {
                                        Text(" 1 Rep per set")
                                    } else {
                            
                                        Text("\(repNumber) Reps per set")
                                    }
                    }
                        Stepper(value: $secondsHeld, in: 1...59) {
                                
                                if secondsHeld == 1 {
                                    Text(" 1 Second Held")
                                } else {
                        
                                    Text("\(secondsHeld) Seconds Held")
                                }
                            
                            
                            }
                        
                        TextField("Equipment Needed",text: $equipment)
                    
                    
        }
                    
                    
                    
                    
                    }
                
                }
                
                Button("Save Exercise") {
                    
                    if self.selectedExercise == 0 {
                        
                        var di = Double(self.targetDistance)
                       // var cardioforSave = Cardio(m: metrics.km, h: Int(self.targetHour), min: Int(self.targetMins), dis: di ?? 0,equipment: self.equipment, n: self.nameOfExercise, des: self.desription)
                        var cardioForSave = cardio(name: self.nameOfExercise, description: self.desription, hours: Int(self.targetHour), minutes: Int(self.targetMins), distance: di ?? 0, equipmentNeeded: self.equipment)
                        db.sharedInstance.cardioList.append(cardioForSave)
                        db.sharedInstance.saveCardioList()
                        print(db.sharedInstance.cardioList.count)
                        for i in db.sharedInstance.cardioList {
                            
                            //everytime self runs its an empty array
                            //do the encode decode stuff somewhere else to add to that array
                            // and then it shouldn tneed self all the time
                            print(i.name)
                        }
                      
                    
                    } else if self.selectedExercise == 1 {
                        var weight = Double(self.weightForStrength)
                        var strengthForSave = strength(name: self.nameOfExercise, description: self.desription, sets: self.setNumber, reps: self.repNumber, weight: weight ?? 0, equipment: self.equipment)
                        db.sharedInstance.strengthList.append(strengthForSave)
                        db.sharedInstance.saveStrengthList()
                        print(db.sharedInstance.strengthList.count)
                        
                    } else {
                       // var flexForSave = Flexibility(rep: Int(self.repNumber), set: Int(self.setNumber), time: self.secondsHeld, name: self.nameOfExercise, equip: self.equipment, desc: self.desription)
                        var flexibilityForSave = flexibility(name: self.nameOfExercise, description: self.desription, reps: self.repNumber, sets: self.setNumber, timeHeld: Int(self.timeHeld) ?? 0, equipment: self.equipment)
                        db.sharedInstance.flexibilityList.append(flexibilityForSave)
                        db.sharedInstance.saveFlexibilityList()
                        print(db.sharedInstance.flexibilityList.count)
                        
                    }
                    
                    
                    
                }
                    .frame(width: 300, height: 25, alignment: .center)
                .accentColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
//                .alignmentGuide(.center, computeValue: 20)
                    .font(.headline)
                .padding()
                
                
                    
                
            
            }
            .background(Color(UIColor.systemGray6))
           
                
                
                
                .navigationBarTitle("Create Exercise")
            .onAppear(){
                print("hhbhb")
                 for i in db.sharedInstance.cardioList {
                print(i.name)
            }
                for i in db.sharedInstance.strengthList {
                    print(i.name)
                }
                
                for i in db.sharedInstance.flexibilityList {
                    print(i.name)
                }
            }
                }
                    
                
                
            }
    
    
    
    
    
       /**
        Function to write details about a session to the bookmark.list file.
        */
      
       
    
    
        
}
            
    



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
