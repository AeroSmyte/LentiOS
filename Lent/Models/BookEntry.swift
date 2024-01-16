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
enum Language: CaseIterable, Identifiable, CustomStringConvertible {
  case english, chinese, spanish, italian, russian, ukrainian, portuguese, arabic, japanese, french, german
  
  var id: Self { self }
  
  var description: String {
    switch self {
    case .arabic:
      return "ARA"
    case .chinese:
      return "CHI"
    case .english:
      return "ENG"
    case .french:
      return "FRE"
    case .german:
      return "GER"
    case .italian:
      return "ITA"
    case .japanese:
      return "JPN"
    case .portuguese:
      return "POR"
    case .russian:
      return "RUS"
    case .spanish:
      return "SPA"
    case .ukrainian:
      return "UKR"
    }
  }
}
struct BookEntry: Identifiable, Hashable {
  var bookTitle: String
  var bookAuthor: String
  var bookStatus : BookStatus
  var completed: Bool = true
  var currentProgress: Double
  var lendBorrowDate: Date
  var bookLanguage: Language = .english
  var rating: Int
  var totalPages : Int
  
  var id = UUID()
}
