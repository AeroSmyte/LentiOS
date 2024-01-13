//
//  BookDetailView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/11/24.
//

import SwiftUI

struct BookDetailView: View {
  
  var book: BookEntry
  
  @Binding var isDetailViewPresented: Bool
  
  var body: some View {
    ZStack(alignment: .bottom) {
      ScrollView {
        VStack {
          HStack {
            DaysLentAndRatingView(book: book)
            
            VStack(alignment: .leading) {
              Text(book.bookTitle)
                .font(.system(size: 72))
                .minimumScaleFactor(0.01)
                .lineLimit(3)
                .bold()
                .frame(maxWidth: 210)
              
              Text(book.bookAuthor)
            }
          }
          .padding()
          
          DetailedBookProgressView(book: book)
            .padding(.bottom, 20)
          
          MetadataRatingView(book: book)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(.hidden, for: .tabBar)
        
        
      }
      
      Button {
        isDetailViewPresented = false
      } label: {
        Image(systemName: "xmark")
          .font(.title.weight(.semibold))
          .padding()
          .background(Color.purple)
          .foregroundColor(.white)
          .clipShape(Circle())
          .shadow(radius: 4, x: 0, y: 4)
        
      }
      .padding()
      
    }
  }
}

struct BookDetailView_Previews: PreviewProvider {
  static var previews: some View {
    BookDetailView(book: BookEntry(bookTitle: "Fake Title", bookAuthor: "Lexi McQueen", bookStatus: .lent, currentProgress: 50.0, rating: 4, pageCount: 200), isDetailViewPresented: .constant(true))
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
        .foregroundColor(.gray)
      Text(bottomText)
        .minimumScaleFactor(0.1)
        .lineLimit(1)
        .foregroundColor(.gray)
    }
  }
}

struct MetadataRatingView: View {
  
  var book: BookEntry
  
  var body: some View {
    HStack(spacing: 30) {
      MetadataTextView(topText: "Rating", bottomText: "\(book.rating)".uppercased())
      
      Divider()
      
      MetadataTextView(topText: "Pages", bottomText: "\(book.pageCount)")
      
      Divider()
      
      MetadataTextView(topText: "Lang", bottomText: book.bookLanguage.uppercased())
      
    }
  }
}

struct DaysLentView: View {
  
  var book: BookEntry
  
  var body: some View {
    ZStack(alignment: .leading) {
      RoundedRectangle(cornerRadius: 12)
        .frame(width: 150, height: 150)
        .shadow(color: Color.black.opacity(0.4), radius: 5, x: 0, y: 2)
      
      VStack(alignment: .leading) {
        Text("36")
          .font(.system(size: 60))
          .bold()
          .foregroundColor(.white)
        Text("Days")
          .font(.title2)
          .foregroundColor(.white)
        Text(book.bookStatus == .lent ? "Lent" : "Borrowed")
          .lineLimit(1)
          .font(.title2)
          .foregroundColor(.white)
      }
      .padding()
    }
  }
}

struct DetailedBookProgressView: View {
  var book: BookEntry
  
  var body: some View {
    VStack {
      CircularProgressView(progress: book.currentProgress)
        .frame(width: 200, height: 200)
        .padding(.bottom, 10)
      
      
      Text("\(Int(book.currentProgress))% Done")
        .kerning(3)
    }
    .padding()
  }
}

struct RatingView: View {
  var book: BookEntry
  var rating: Int
  var max: Int = 5
  
  var offImage: Image?
  var onImage = Image(systemName: "star.fill")
  
  var offColor = Color.gray
  var onColor = Color.purple
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 20)
        .frame(width: 150, height: 30)
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

struct DaysLentAndRatingView: View {
  var book: BookEntry
  
  var body: some View {
    VStack {
      DaysLentView(book: book)
      
      RatingView(book: book, rating: book.rating)
      
    }
    .padding(.trailing, 10)
  }
}
