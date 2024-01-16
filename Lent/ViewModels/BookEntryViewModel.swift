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
      .reduce(0) { $0 + $1.totalPages }
  }
  
  var totalPagesLent: Int {
    bookList
      .filter { $0.bookStatus == .lent }
      .reduce(0) { $0 + $1.totalPages }
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
  
  
  func calculateDaysDifference(from date: Date) -> Int? {
      let calendar = Calendar.current
      let currentDate = Date()

      if let difference = calendar.dateComponents([.day], from: date, to: currentDate).day {
          return difference
      } else {
          return nil
      }
  }
  
  func getPercentOfBookComplete(book: BookEntry) -> Int {
    return Int(book.currentProgress) / book.totalPages
  }
  
  
  init() {
    getBooks()
  }
  
  func daysBetween(start: Date, end: Date) -> Int {
      let calendar = Calendar.current
      let components = calendar.dateComponents([.day], from: start, to: end)
      return components.day ?? 0
  }
  
  
  func getBooks() {
    print("I am getting books")
    let calender = Calendar.current
    let dateComponents = DateComponents(calendar: calender, year: 2024, month: 1, day: 1)
    let dateComponents2023 = DateComponents(calendar: calender, year: 2023, month: 1, day: 13)
    let composedDate = calender.date(from: dateComponents)
    let composedDate2023 = calender.date(from: dateComponents2023)
    
    let newBooks : [BookEntry] = [
      BookEntry(bookTitle: "The Old Man & The Sea", bookAuthor: "Hemingway", bookStatus: .borrowed, currentProgress: 45, lendBorrowDate: composedDate!, rating: 2, totalPages: 100),
      BookEntry(bookTitle: "The Pragmatic Programmer", bookAuthor: "No Idea", bookStatus: .lent,completed: false, currentProgress: 23, lendBorrowDate: composedDate!, rating: 3, totalPages: 230),
      BookEntry(bookTitle: "The Myth of Normal", bookAuthor: "Gabor Mate", bookStatus: .lent, completed: false, currentProgress: 45, lendBorrowDate: composedDate2023!,  rating: 4, totalPages: 460),
      BookEntry(bookTitle: "Midnight Gospel", bookAuthor: "Duncan Trussel & Friends", bookStatus: .lent, currentProgress: 90, lendBorrowDate: composedDate2023!, rating: 5, totalPages: 5)
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
    print(bookList)
  }
  
}
