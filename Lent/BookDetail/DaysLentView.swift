//
//  BookDetailsDaysLent.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct DaysLentView: View {
  
  var book: BookEntry
  var daysLentOrBorrowed: Int
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12)
        .frame(width: 150, height: 150)
        .foregroundColor(Color("BackgroundBlack"))
        .shadow(color: Color("BackgroundBlack").opacity(0.4), radius: 10, x: 0, y: 2)
      
        VStack {
          Text("\(daysLentOrBorrowed)")
            .font(.system(size: 60))
            .frame(maxWidth: 150)
            .lineLimit(1)
            .layoutPriority(1)
            .minimumScaleFactor(0.8)
            .bold()
          Text("Days")
            .font(.title2)
          Text(book.bookStatus == .lent ? "Lent" : "Borrowed")
            .lineLimit(1)
            .font(.title2)
        }
        .foregroundColor(Color("SecondaryTextColor"))

        .padding()
      }
  }
}

struct DaysLentView_Previews: PreviewProvider {
  static var previews: some View {
    DaysLentView(
      book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200),
      daysLentOrBorrowed: 4500)
  }
}
