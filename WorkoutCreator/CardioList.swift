//
//  CardioList.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 03/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI



struct CardioList: View {
    
    var cardioArray = db.sharedInstance.cardioList
    
    

     @ObservedObject var d = db()
    
    var body: some View {
        
       // NavigationView {
            List(cardioArray) { cardio in
                VStack {
                Text(cardio.name)
                    //Spacer()
                    HStack {
                        Text(cardio.description)
                        //Spacer()
                        Text(String(cardio.distance))
                        Button("Add"){
                            print("Added")
                            self.d.cardioForWorkout.append(cardio)
                            db.sharedInstance.cardioForWorkout.append(cardio)
                            for i in db.sharedInstance.cardioForWorkout {
                                print(i.name)
                            }
                        }
                    }
                
                }
                
            
        }
        .onAppear(){
            print("APPEAR")
            for i in db.sharedInstance.cardioList {
                print(i.name)
            }
        }
    .navigationBarTitle("Cardio Exercises")
    }
}

struct CardioList_Previews: PreviewProvider {
    static var previews: some View {
        CardioList()
    }
}
