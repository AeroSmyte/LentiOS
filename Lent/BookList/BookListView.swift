//
//  ContentView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import SwiftUI


struct BookListView: View {
  
  @ObservedObject var viewModel = BookEntryViewModel.shared
  
  private let gridColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
  
  init() {

          UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "PrimaryTextColor") ?? .red]

  }
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVGrid(columns: gridColumns, spacing: 30) {
          ForEach(viewModel.bookList, id: \.id) { book in
            BookCard(book: book)
            
          }
        }
      }
      .navigationTitle("Lent")
      .navigationDestination(for: BookEntry.self) { book in
        BookDetailView(book: book)
      }
    }
  }
  
  
  struct BookListContentView_Previews: PreviewProvider {
    static var previews: some View {
      BookListView()
    }
  }
}
