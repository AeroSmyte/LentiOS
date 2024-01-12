//
//  AddBookEntryView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/12/24.
//

import SwiftUI

struct AddBookEntryView: View {
  
  
  @State var newTitle : String = ""
  @State var newAuthor : String = ""
  @State var newBookStatus : BookStatus = .lent
  @State var currentDate: Date = Date()
  @State var newCompleted: Bool = false
  @State var newPageCount : Int = 0
  @State var newCurrentPage: Int = 0
  @State var newRating: Int = 0
  
  
    var body: some View {
      NavigationView {
        Form {
          Section("Book Information") {
            TextField("Book Title", text: $newTitle)
            TextField("Book Author", text: $newAuthor)
          }
          
          Section("Book Status") {
            
            Picker("Lent or Borrowed?", selection: $newBookStatus) {
              ForEach(BookStatus.allCases) { option in
                Text(String(describing: option))
              }
            }
            .pickerStyle(.segmented)
            
            
            DatePicker(newBookStatus == .lent ? "Lend Date" : "Borrow Date", selection: $currentDate, displayedComponents: [.date])
            
            Toggle("Completed?", isOn: $newCompleted)
            
          }
          
          Section("Total Page Count") {
            // using custom binding to convert numeric values straight ahead. State variable is a number instead of a string, and i'm setting a default value in case one isn't set.
            TextField("Total Page Count", text: Binding(
              get: { String(newPageCount) },
              set: { newPageCount = Int($0) ?? 0 }
            ))
            
          }
          
          Section("Current Page") {

            TextField("What Page Are You On?", text: Binding(
              get: { String(newCurrentPage) },
              set: { newCurrentPage = Int($0) ?? 0 }
          ))
              
          }
      
          Section("How excited are you to read it?") {
            
          }
          
        }
      }
      .navigationTitle("Add a New Book")
    }
  
  func getDatePickerTitle(for bookStatus: BookStatus) -> String {
    bookStatus == .lent ? "Lend Date" : "Borrow Date"
    
  }
}

struct AddBookEntryView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookEntryView()
    }
}
