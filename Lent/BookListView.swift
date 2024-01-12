//
//  ContentView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import SwiftUI


struct BookListView: View {
  
  @ObservedObject var viewModel = BookListViewModel.shared
  
  var body: some View {
    NavigationView {
      BookEntryView(viewModel: viewModel)
        .navigationTitle("Lent")
    }
  }
}

struct BookListContentView_Previews: PreviewProvider {
  static var previews: some View {
    BookListView(viewModel: BookListViewModel())
  }
}

struct BookEntryView: View {
  
  var viewModel: BookListViewModel
  
  private let gridColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    ScrollView {
      
      LazyVGrid(columns: gridColumns, spacing: 30) {
        ForEach(viewModel.allBooks(), id: \.id) { book in
          NavigationLink(destination: BookDetailView(book: book)) {
            LazyVStack {
              VStack {
                ZStack {
                  CircularProgressView(progress: book.currentProgress)
                    .frame(width: 120, height: 120)
                    .padding(.bottom, 5)
                  
                  Image(systemName: book.completed ? "book.circle.fill" : "book.closed.circle.fill")
                    .resizable()
                    .foregroundColor(.black.opacity(0.8))
                    .frame(width: 75, height: 75)
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom, 5)
                }
                Text("\(Int(book.currentProgress))%")
                  .font(.caption)
                  .foregroundColor(.gray)
                  .padding(.bottom, -15)
                
                Text(book.bookTitle)
                  .font(.title3)
                  .foregroundColor(.black)
                  .multilineTextAlignment(.center)
                  .frame(minWidth: 150)
                  .padding(10)
              }
              .padding()
              
              
            }
            
          }
        }
        .padding(.top, 10)
      }
    }
  }
}

struct CircularProgressView: View {
  
  var progress: Double
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(
          Color.gray.opacity(0.5),
          lineWidth: 7
        )
      Circle()
      // the total is always a percent out of 100
        .trim(from: 0, to: Double(progress / 100))
        .stroke(
          Color.purple,
          style: StrokeStyle (
            lineWidth: 7,
            lineCap: .round
          )
        )
        .rotationEffect(.degrees(-90))
    }
    
  }
}


