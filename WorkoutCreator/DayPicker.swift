//
//  DayPicker.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 09/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct DayPicker: View {
    
    var daysToPick = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var body: some View {
        List(daysToPick, id: \.self) { day in
            
            HStack {
            Text(day)
                Spacer()
                Button(action: {
                    db.sharedInstance.daysRepeated.append(day)
                }) {
                    Image("plus").colorInvert()
                }
            }
        }
        
        
    .navigationBarTitle("Repeat Workout On Days")
    }
}

struct DayPicker_Previews: PreviewProvider {
    static var previews: some View {
        DayPicker()
    }
}
