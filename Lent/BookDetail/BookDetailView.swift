//
//  BookDetailView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/11/24.
//

import SwiftUI

struct BookDetailView: View {
  
  let calender = Calendar.current
  
  var book: BookEntry
  @ObservedObject var viewModel = BookEntryViewModel.shared
  
  
  var body: some View {
    ZStack(alignment: .bottom) {
      ScrollView {
        VStack {
          BookDetailsHeaderView(book: book, viewModel: viewModel)
          
          BookDetailedProgressView(book: book, viewModel: viewModel)
            .padding(.bottom, 20)
          
          MetadataRatingView(book: book)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
      }
      FloatingExitButton()
    }
  }
}


struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.now, rating: 4, totalPages: 200)
        )
    }
}
