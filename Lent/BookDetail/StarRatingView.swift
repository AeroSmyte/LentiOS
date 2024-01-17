//
//  RatingView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct StarRatingView: View {
  var book: BookEntry
  var rating: Int
  var max: Int = 5
  
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  
  var offColor = Color.gray
  var onColor = Color("AccentColor")
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: 150, height: 30)
        .foregroundColor(Color("BackgroundBlack"))
        .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 2)
      
      HStack {
        ForEach(1..<(max + 1), id: \.self) { number in
          Button {
            
          } label: {
            ratingImage(for: number)
              .foregroundStyle(number > rating ? offColor : onColor)
          }
          
        }
      }
    }
  }
  
  func ratingImage(for number: Int) -> Image {
    number > rating ? (offImage ?? onImage) : onImage
  }
}


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        StarRatingView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200), rating: 3)
        
        StarRatingView(
          book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50, lendBorrowDate: Date.distantPast, rating: 4, totalPages: 200), rating: 3)
        .preferredColorScheme(.dark)
        
        
      }
    }
}
