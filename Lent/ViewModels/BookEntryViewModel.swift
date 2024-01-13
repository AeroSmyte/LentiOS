//
//  BookEntryViewModel.swift
//  Lent
//
//  Created by Lexi McQueen on 1/12/24.
//

import Foundation

class BookEntryViewModel: ObservableObject {
  static let shared = BookEntryViewModel()
  
  @Published var bookList: [BookEntry] = []
  
  var totalPagesBorrowed: Int {
    bookList
      .filter { $0.bookStatus == .borrowed }
      .reduce(0) { $0 + $1.pageCount }
  }
  
  var totalPagesLent: Int {
    bookList
      .filter { $0.bookStatus == .lent }
      .reduce(0) { $0 + $1.pageCount }
  }
  
  var totalBooksBorrowed: Int {
    bookList
      .filter { $0.bookStatus == .borrowed }
      .count
  }
  
  var totalBooksLent: Int {
    bookList
      .filter { $0.bookStatus == .lent }
      .count
  }
  
  init() {
    getBooks()
  }
  
  func getBooks() {
    let newBooks = [
      BookEntry(bookTitle: "The Old Man & The Sea", bookAuthor: "Hemingway", bookStatus: .borrowed, currentProgress: 45.0, rating: 2, pageCount: 100),
      BookEntry(bookTitle: "The Pragmatic Programmer", bookAuthor: "No Idea", bookStatus: .lent,completed: false, currentProgress: 23.0, rating: 3, pageCount: 230),
      BookEntry(bookTitle: "The Myth of Normal", bookAuthor: "Gabor Mate", bookStatus: .lent, completed: false, currentProgress: 45.0, rating: 4, pageCount: 460),
      BookEntry(bookTitle: "Midnight Gospel", bookAuthor: "Duncan Trussel & Friends", bookStatus: .lent, currentProgress: 90.0, rating: 5, pageCount: 5)
    ]
    bookList.append(contentsOf: newBooks)
  }
  
  func deleteBook(book: BookEntry) {
    if let index = bookList.firstIndex(where: { $0.id == book.id }) {
      bookList.remove(at: index)
    }
  }
  
  func addBook(book: BookEntry) {
    bookList.append(book)
  }
  
}
