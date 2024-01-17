//
//  BookDetailsHeaderView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct BookDetailsHeaderView: View {
  var book: BookEntry
  var viewModel: BookEntryViewModel
  
  var body: some View {
    HStack {
      DaysLentAndRatingView(book: book, dayDifference: viewModel.daysBetween(start: book.lendBorrowDate, end: .now))
      
      BookDetailTitleView(book: book)
    }
    .padding()
  }
}




struct BookDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsHeaderView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200)
, viewModel: BookEntryViewModel())
    }
}
