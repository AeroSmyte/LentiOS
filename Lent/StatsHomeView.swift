//
//  BookStatMenuView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import SwiftUI

struct StatsHomeView: View {
  
  
  var body: some View {
      VStack {
        LogoTitle()
        
        PagesBorrowedView()
        PagesLentView()
        
        HStack {
          BookMoodBlockView(title: "BIP", number: 12)
          BookMoodBlockView(title: "DNF", number: 2)
          BookMoodBlockView(title: "To Read", number: 10)
        }
      }
  }
}

struct BookStatMenuView_Previews: PreviewProvider {
  static var previews: some View {
    StatsHomeView()
  }
}

struct LogoTitle: View {
  var body: some View {
    VStack {
      HStack {
        VStack(alignment: .center, spacing: 3){
          Text("Personal Lib")
            .font(.largeTitle)
            .bold()
          Text("Keep your library personal.".uppercased())
            .font(.callout)
            .kerning(2)
        }
        .padding(.bottom, 30.0)
      }
    }
    .padding(.bottom)
  }
}

struct PagesBorrowedView: View {
  var body: some View {
    VStack(spacing: 10) {
      Text("1100 pages".uppercased())
        .font(.largeTitle)
        .bold()
        .kerning(3)
      Text("Read".uppercased())
        .kerning(4)
        .bold()
        .font(.title2)
    }.opacity(0.8)
      .frame(width: 350, height: 150)
      .background(Color.purple)
      .cornerRadius(14)
      .foregroundColor(.white)
      .shadow(radius: 10)
    
  }
}

struct PagesLentView: View {
  var body: some View {
    VStack(spacing: 10) {
      Text("1100 pages".uppercased())
        .font(.largeTitle)
        .bold()
        .kerning(3)
      Text("Lent".uppercased())
        .kerning(4)
        .bold()
        .font(.title2)
    }.opacity(0.8)
      .frame(width: 350, height: 150)
      .background(Color.purple)
      .cornerRadius(14)
      .foregroundColor(.white)
      .shadow(radius: 10)
    
  }
}

struct BookMoodBlockView: View {
  
  var title: String
  var number: Int
  
  var body: some View {
    VStack(spacing: 12) {
      Text(title)
        .font(.title2)
        .fontWeight(.heavy)
      Text("\(number)")
        .font(.title3)
      
    }
    .frame(width: 100, height: 100)
    .background(Color("DarkGray"))
    .cornerRadius(14)
    .foregroundColor(.white)
  }
}
