//
//  ProgressBarLayerIconView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/16/24.
//

import SwiftUI

struct ProgressBarLayerIconView: View {
  var book: BookEntry
  
  var body: some View {
    ZStack {
      CircularProgressView(progress: Double(book.currentProgress))
        .frame(width: 120, height: 120)
        .padding(.bottom, 5)
      
      Image(systemName: book.completed ? "book.circle.fill" : "book.closed.circle.fill")
        .resizable()
        .foregroundColor(Color("AccentBlue"))
        .frame(width: 75, height: 75)
        .aspectRatio(contentMode: .fit)
        .padding(.bottom, 5)
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
          Color("AccentColor"),
          style: StrokeStyle (
            lineWidth: 7,
            lineCap: .round
          )
        )
        .rotationEffect(.degrees(-90))
    }
  }
}


struct ProgressBarLayerIconView_Previews: PreviewProvider {
    static var previews: some View {
      ProgressBarLayerIconView(book: BookEntry(bookTitle: "Star Wars", bookAuthor: "George Lucas", bookStatus: .borrowed, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 1, totalPages: 1000))
    }
}
