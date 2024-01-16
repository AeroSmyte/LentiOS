//
//  AddBookEntryView.swift
//  Lent
//
//  Created by Lexi McQueen on 1/12/24.
//

import SwiftUI

struct AddBookEntryView: View {
  
  @Binding var isAddEntryViewPresented: Bool
  
  @StateObject var viewModel = BookEntryViewModel.shared
  
  @State var newTitle : String = ""
  @State var newAuthor : String = ""
  @State var newBookStatus : BookStatus = .lent
  @State var currentDate: Date = Date()
  @State var newCompleted: Bool = false
  @State var newPageCount : Int = 0
  @State var newCurrentPage: Int = 0
  @State var newRating: Double = 0.0
  @State var newBookLanguage: Language = .english
  
  
  var body: some View {
    ZStack(alignment: .bottomTrailing) {
      Form {
        Section("Book Information") {
          Picker("Lent or Borrowed?", selection: $newBookStatus) {
            ForEach(BookStatus.allCases) { option in
              Text(String(describing: option))
            }
          }
          .pickerStyle(.segmented)
          .padding(.bottom)
          TextField("Book Title", text: $newTitle)
          TextField("Book Author", text: $newAuthor)
          Toggle("Completed?", isOn: $newCompleted)
          
        }
        .bold()
        
        Section("Book Status") {
          DatePicker(getDatePickerTitle(for: newBookStatus), selection: $currentDate, displayedComponents: [.date])
          
          Picker("Book Language", selection: $newBookLanguage) {
            ForEach(Language.allCases) { language in
              Text(String(describing: language))
            }
          }
          
        }
        .bold()
        
       
        
        Section("Total Page Count") {
          // using custom binding to convert numeric values straight ahead. State variable is a number instead of a string, and i'm setting a default value in case one isn't set.
          TextField("Total Page Count", text: Binding(
            get: { String(newPageCount) },
            set: { newPageCount = Int($0) ?? 0 }
          ))
          
        }
        .bold()
        
        
        Section("Current Page") {
          
          TextField("What Page Are You On?", text: Binding(
            get: { String(newCurrentPage) },
            set: { newCurrentPage = Int($0) ?? 0 }
          ))
          
        }
        .bold()
        
        
        Section("How excited are you to read it?") {
          VStack(alignment: .leading) {
            Slider(value: $newRating, in: 0...5, step: 1.0)
              .frame(width:300, height:30)
            Text(
              String(format: newRating == 1.0 ? "%.0f star" : "%.0f stars", newRating)
            )
            .foregroundColor(Color.purple)
          }
        }
      }
      .foregroundColor(Color.purple)
      .scrollContentBackground(.hidden)
      .navigationTitle("Add a New Book")
      .navigationBarBackButtonHidden(true)
      .toolbar(content: {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            isAddEntryViewPresented = false
          } label: {
            Image(systemName: "chevron.backward")
              .foregroundColor(Color.purple)
            Text("Back")
              .foregroundColor(Color.purple)
          }
          
        }
        
      })
      .padding(-10)
      
      
      Button {
        let newBook = BookEntry(
          bookTitle: newTitle,
          bookAuthor: newAuthor,
          bookStatus: newBookStatus,
          currentProgress: Double(newCurrentPage),
          lendBorrowDate: currentDate,
          bookLanguage: newBookLanguage,
          rating: Int(newRating),
          totalPages: newPageCount)
        
        viewModel.addBook(book: newBook)
        isAddEntryViewPresented = false
      } label: {
        Text("Save Book")
          .font(.headline.weight(.semibold))
          .padding()
          .background(Color.purple)
          .foregroundColor(.white)
          .clipShape(Capsule())
          .shadow(radius: 4, x: 0, y: 4)
      }
      .padding()
      
    }
    
  }
  
  func getDatePickerTitle(for bookStatus: BookStatus) -> String {
    return bookStatus == .lent ? "Lend Date" : "Borrow Date"
  }
}

struct AddBookEntryView_Previews: PreviewProvider {
  static var previews: some View {
    AddBookEntryView(isAddEntryViewPresented: .constant(true))
  }
}
