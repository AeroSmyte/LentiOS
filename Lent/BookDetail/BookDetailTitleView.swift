//
//  BookTitleAuthorView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct BookDetailTitleView: View {
  var book: BookEntry
  
  var body: some View {
    VStack(alignment: .listRowSeparatorLeading) {
      BookTitleTextView(book: book)
      
      BookAuthorTextView(book: book)
    }
    .foregroundColor(Color("PrimaryTextColor"))
  }
}

struct BookAuthorTextView: View {
  var book: BookEntry
  
  var body: some View {
    Text(book.bookAuthor)
  }
}

struct BookTitleTextView: View {
  var book: BookEntry

  var body: some View {
    Text(book.bookTitle)
      .font(.system(size: 72))
      .minimumScaleFactor(0.01)
      .lineLimit(3)
      .bold()
      .frame(maxWidth: 210)
  }
}


struct BookDetailTitleView_Previews: PreviewProvider {
    static var previews: some View {
      BookDetailTitleView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200)
        )
    }
}
