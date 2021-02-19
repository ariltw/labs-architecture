//
//  ContentView.swift
//  Foodies
//
//  Created by Ariel Theodore W on 25/06/20.
//  Copyright © 2020 ariltw. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(0...3) {_ in
                    Text("1")
                }
            }.navigationBarTitle("Hey")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
