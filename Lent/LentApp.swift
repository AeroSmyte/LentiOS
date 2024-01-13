//
//  LentApp.swift
//  Lent
//
//  Created by Lexi McQueen on 1/10/24.
//

import SwiftUI

@main
struct LentApp: App {
  
  @StateObject var bookEntryViewModel: BookEntryViewModel = BookEntryViewModel()
  
    var body: some Scene {
        WindowGroup {
          MainView()
            .environmentObject(bookEntryViewModel)
        }
    }
}
