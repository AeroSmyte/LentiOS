//
//  DaysLentBorrowedView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct DaysLentAndRatingView: View {
  var book: BookEntry
  var dayDifference: Int
  
  var body: some View {
    VStack {
      DaysLentView(book: book, daysLentOrBorrowed: dayDifference)
      
      StarRatingView(book: book, rating: book.rating)
      
    }
    .padding(.trailing, 10)
  }
}

struct DaysLentAndRatingView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        DaysLentAndRatingView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200),
        dayDifference: 45)
        
        DaysLentAndRatingView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200),
        dayDifference: 900000)
        .preferredColorScheme(.dark)
      }
    }
}
