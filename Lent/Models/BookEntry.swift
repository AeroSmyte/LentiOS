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
