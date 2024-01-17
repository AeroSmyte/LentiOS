//
//  BookStatMenuView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import SwiftUI

struct StatsHomeView: View {
  
  
  @ObservedObject var viewModel = BookEntryViewModel.shared

  var body: some View {
      VStack {
        LogoTitle()
        
        PagesBorrowedView(pagesBorrowed: viewModel.totalPagesBorrowed)
        PagesLentView(pagesLent: viewModel.totalPagesLent)
        
        HStack(spacing: 50) {

          BookMoodBlockView(title: "Lent", number: viewModel.totalBooksLent)
          BookMoodBlockView(title: "Borrowed", number: viewModel.totalBooksBorrowed)

        }
        Text("Keep Reading!")
          .padding(.top)
          .font(.largeTitle)
          .bold()

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
    .foregroundColor(Color("PrimaryTextColor"))
  }
}

// TODO: Make the Borrowed/Lent view into one reusable view

struct PagesBorrowedView: View {
  
  var pagesBorrowed: Int
  
  var body: some View {
    VStack(spacing: 10) {
      Text("\(pagesBorrowed) pages".uppercased())
        .font(.largeTitle)
        .bold()
        .kerning(3)
      Text("Read".uppercased())
        .kerning(4)
        .bold()
        .font(.title2)
    }.opacity(0.8)
      .frame(width: 350, height: 150)
      .foregroundColor(Color("PrimaryTextColor"))
      .background(Color("AccentColor"))
      .cornerRadius(14)
      .shadow(radius: 10)
    
  }
}

struct PagesLentView: View {
  
  var pagesLent: Int

  var body: some View {
    VStack(spacing: 10) {
      Text("\(pagesLent) pages".uppercased())
        .font(.largeTitle)
        .bold()
        .kerning(3)
      Text("Lent".uppercased())
        .kerning(4)
        .bold()
        .font(.title2)
    }.opacity(0.8)
      .frame(width: 350, height: 150)
      .foregroundColor(Color("PrimaryTextColor"))
      .background(Color("AccentColor"))
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
        .minimumScaleFactor(0.9)
        .lineLimit(2)
      Text("\(number)")
        .font(.title3)
      
    }
    .frame(width: 150, height: 100)
    .background(Color("AccentBlue"))
    .cornerRadius(14)
    .foregroundColor(Color("SecondaryTextColor"))
  }
}
