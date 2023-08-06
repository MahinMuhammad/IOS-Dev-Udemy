//
//  ContentView.swift
//  I Am Rich SwiftUI
//
//  Created by Md. Mahinur Rahman on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(.systemTeal).ignoresSafeArea()
            VStack {
                Image(systemName: "bitcoinsign.circle")
                    .imageScale(.large)
                    .foregroundColor(.white)
            
                Text("I am Rich")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
