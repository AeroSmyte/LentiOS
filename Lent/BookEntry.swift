//
//  BookEntry.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import Foundation

// CaseIterable gives us the synthesized 'allCases' property
enum BookStatus: CaseIterable, Identifiable, CustomStringConvertible {
  case lent, borrowed
  
  var id: Self { self }
  
  var description: String {
    switch self {
    case .lent:
      return "Lent"
    case .borrowed:
      return "Borrowed"
    }
  }
}

struct BookEntry: Identifiable, Hashable {
  var bookTitle: String
  var bookAuthor: String
  var bookStatus : BookStatus
  var completed: Bool = true
  var currentProgress: Double
  var daysBorrowed: Int?
  var daysLent: Int?
  var bookLanguage: String = "ENG"
  var rating: Int
  var pageCount : Int
  
  var id = UUID()

}

class BookListViewModel: ObservableObject {
  static let shared = BookListViewModel()
  
  @Published var currentBook: BookEntry = BookEntry(bookTitle: "Percy Jackson and the Lightning Thief", bookAuthor: "Riordan",bookStatus: .borrowed, completed: true, currentProgress: 99, daysBorrowed: 1345, rating: 5, pageCount: 200)

  let bookList: [BookEntry] = [
    BookEntry(bookTitle: "The Old Man & The Sea", bookAuthor: "Hemingway", bookStatus: .borrowed, currentProgress: 45.0, rating: 2, pageCount: 100),
    BookEntry(bookTitle: "The Pragmatic Programmer", bookAuthor: "No Idea", bookStatus: .lent,completed: false, currentProgress: 23.0, rating: 3, pageCount: 230),
    BookEntry(bookTitle: "The Myth of Normal", bookAuthor: "Gabor Mate", bookStatus: .lent, completed: false, currentProgress: 45.0, rating: 4, pageCount: 460),
    BookEntry(bookTitle: "Midnight Gospel", bookAuthor: "Duncan Trussel & Friends", bookStatus: .lent, currentProgress: 90.0, rating: 5, pageCount: 5)
      ]
  
  func setCurrentBook(to book: BookEntry) -> Void {
    self.currentBook = book
  }
  
  func allBooks() -> [BookEntry] {
    return bookList
  }
}
