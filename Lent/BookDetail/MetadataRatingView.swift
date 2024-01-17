//
//  MetadataRatingView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct MetadataRatingView: View {
  
  var book: BookEntry
  
  var body: some View {
    HStack(spacing: 30) {
      MetadataTextView(topText: "Rating", bottomText: "\(book.rating)".uppercased())
      
      Divider()
      
      MetadataTextView(topText: "Pages", bottomText: "\(book.totalPages)")
      
      Divider()
      
      MetadataTextView(topText: "Lang", bottomText: book.bookLanguage.description)
      
    }
    .frame(height: 80)
  }
}

struct MetadataTextView: View {
  
  var topText: String
  var bottomText: String
  
  var body: some View {
    VStack(spacing: 4) {
      Text(topText)
        .minimumScaleFactor(0.01)
        .lineLimit(1)
        .foregroundColor(Color("AppGray"))
      Text(bottomText)
        .minimumScaleFactor(0.1)
        .lineLimit(1)
        .foregroundColor(Color("AppGray"))
    }
  }
}

struct MetadataRatingView_Previews: PreviewProvider {
  static var previews: some View {
    MetadataRatingView(
      book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200)
      
    )
  }
}


