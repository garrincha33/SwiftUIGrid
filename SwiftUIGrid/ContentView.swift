//
//  ContentView.swift
//  SwiftUIGrid
//
//  Created by Richard Price on 20/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    @State var search = ""
    @State var index = 0
    @State var column = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                HStack {
                    Text("Game Store")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
            }.padding(.horizontal)
            
            TextField("Search", text: self.$search)
                .padding(.vertical, 10)
                .padding(.horizontal)
                .background(Color.black.opacity(0.07))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.top, 25)
            //Carousel list
            TabView(selection: self.$index) {
                ForEach(1...5, id: \.self) {index in
                    Image("p\(index)")
                        .resizable()
                        //adding animation
                        .frame(height: self.index == index ? 230 : 180)
                        .cornerRadius(15)
                        .padding(.horizontal)
                        //identify current index
                        .tag(index)
                }
            }.frame(height: 230)
            .padding(.top, 35)
            .tabViewStyle(PageTabViewStyle())
            .animation(.easeOut)
            
            //adding custom grid
            HStack {
                Text("Popular")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: self.column.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                })
            }.padding()
        }
        .padding(.vertical)
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
