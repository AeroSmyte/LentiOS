//
//  BookCard.swift
//  Lent
//
//  Created by Lexi McQueen on 1/16/24.
//

import SwiftUI

struct BookCard: View {
  var book: BookEntry
  
  var body: some View {
    NavigationLink(value: book) {
      LazyVStack {
        VStack {
          ProgressBarLayerIconView(book: book)
          Text("\(Int(book.currentProgress))%")
            .font(.caption)
            .foregroundColor(Color("AppGray"))
            .padding(.bottom, -15)
          
          Text(book.bookTitle)
            .font(.title3)
            .foregroundColor(Color("PrimaryTextColor"))
            .multilineTextAlignment(.center)
            .frame(minWidth: 150)
            .padding(10)
        }
        .padding()
        .shadow(radius: 4)
      }
      
    }
  }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
      BookCard(book: BookEntry(bookTitle: "Star Wars", bookAuthor: "George Lucas", bookStatus: .borrowed, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 1, totalPages: 400))
    }
}
