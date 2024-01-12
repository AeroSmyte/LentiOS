//
//  MainView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/12/24.
//

import SwiftUI

struct MainView: View {
  
  var body: some View {
    TabView {
      StatsHomeView()
        .tabItem {
          Image(systemName: "house")
          Text("Home")
        }
      BookListView()
        .tabItem {
          Image(systemName: "books.vertical")
          Text("Books")
        }
      
      AddBookEntryView()
        .tabItem {
          Image(systemName: "plus.circle")
          Text("Add Books")
        }
    }
    .accentColor(.purple)
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
