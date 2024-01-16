//
//  ContentView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import SwiftUI


struct BookListView: View {
  
  @ObservedObject var viewModel = BookEntryViewModel.shared
  
  @State private var isAddEntryViewPresented = false
  
  var body: some View {
    NavigationView {
      BookCardList(viewModel: viewModel)
        .navigationTitle("Lent")
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(destination: AddBookEntryView(isAddEntryViewPresented: $isAddEntryViewPresented), isActive: $isAddEntryViewPresented) {
              Button("Add Book") {
                isAddEntryViewPresented = true
              }
              .foregroundColor(.purple)
            }
          }
        }
    }
  }
}

struct BookListContentView_Previews: PreviewProvider {
  static var previews: some View {
    BookListView(viewModel: BookEntryViewModel())
  }
}

struct BookCardList: View {
  
  var viewModel: BookEntryViewModel
  
  @State private var isDetailViewPresented : Bool = false
  
  
  private let gridColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: gridColumns, spacing: 30) {
        ForEach(viewModel.bookList, id: \.id) { book in
          NavigationLink(destination: BookDetailView(book: book, isDetailViewPresented: $isDetailViewPresented), isActive: $isDetailViewPresented) {
            LazyVStack {
              VStack {
                ProgressBarLayerIconView(book: book)
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
        .trim(from: 0, to: Double(progress) / 100.0)
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



struct ProgressBarLayerIconView: View {
  var book: BookEntry
  
  var body: some View {
    ZStack {
      CircularProgressView(progress: Double(book.currentProgress))
        .frame(width: 120, height: 120)
        .padding(.bottom, 5)
      
      Image(systemName: book.completed ? "book.circle.fill" : "book.closed.circle.fill")
        .resizable()
        .foregroundColor(.black.opacity(0.8))
        .frame(width: 75, height: 75)
        .aspectRatio(contentMode: .fit)
        .padding(.bottom, 5)
    }
  }
}
