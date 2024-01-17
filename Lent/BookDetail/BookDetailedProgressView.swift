//
//  BookDetailedProgressView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct BookDetailedProgressView: View {
  var book: BookEntry
  var viewModel: BookEntryViewModel
  
  var body: some View {
    VStack {
      CircularProgressView(progress: book.currentProgress)
        .frame(width: 200, height: 200)
        .padding(.bottom, 10)
      
      
      Text("\(viewModel.calculateCompletionPercentage(currentPage: Int(book.currentProgress), totalPages: book.totalPages))% Done")
        .kerning(3)
        .foregroundColor(Color("PrimaryTextColor"))
    }
    .padding()
  }
}

struct BookDetailedProgressView_Previews: PreviewProvider {
    static var previews: some View {
      BookDetailedProgressView(
        book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200),
    viewModel: BookEntryViewModel())
    }
}
