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
            HStack(spacing: 225) {
                Text("Popular")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: self.column.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                        .font(.system(size: 24))
                        .foregroundColor(.black)
                })
            }.padding()
            
            LazyVGrid(columns: self.column, spacing: 25){
             ForEach(data){game in
                GridView(game: game)
                    }
            }.padding([.horizontal, .top])
            
            
        }
        .padding(.vertical)
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
    }
}

struct GridView: View {
    var game: Game
    var body: some View {
        VStack(spacing: 15) {
            Image(game.image)
                .resizable()
                .frame(height: 250)
                .cornerRadius(15)
            
            Text(game.name)
                .fontWeight(.bold)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Buy Now")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color.red)
                    .cornerRadius(10)
            })
        }
    }
}

struct Game : Identifiable {
    
    var id : Int
    var name : String
    var image : String
    var rating : Int
}

var data = [

    Game(id: 0, name: "Resident Evil 3", image: "g2", rating: 3),
    Game(id: 1, name: "GTA 5", image: "g3", rating: 5),
    Game(id: 2, name: "Assaisan Creed Odesey", image: "g4", rating: 3),
    Game(id: 3, name: "Resident Evil 7", image: "g5", rating: 2),
    Game(id: 4, name: "Watch Dogs 2", image: "g6", rating: 1),
    Game(id: 5, name: "The Evil Within 2", image: "g7", rating: 2),
    Game(id: 6, name: "Tomb Raider 2014", image: "g8", rating: 4),
    Game(id: 7, name: "Shadow Of The Tomb Raider", image: "g1", rating: 4),

]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
