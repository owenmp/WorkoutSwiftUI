//
//  TabBar.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 07/09/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            CreateView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
            }.tag(0)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
