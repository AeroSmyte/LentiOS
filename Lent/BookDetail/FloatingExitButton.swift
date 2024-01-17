//
//  FloatingExitButton.swift
//  Lent
//
//  Created by Lexi McQueen on 1/17/24.
//

import SwiftUI

struct FloatingExitButton: View {
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    Button {
      presentationMode.wrappedValue.dismiss()
    } label: {
      Image(systemName: "xmark")
        .font(.title.weight(.semibold))
        .padding()
        .background(Color("BackgroundBlack"))
        .foregroundColor(colorScheme == .light ? .white : .black)
        .clipShape(Circle())
        .shadow(radius: 4, x: 0, y: 4)
      
    }
    .padding()
  }
}

struct FloatingExitButton_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        FloatingExitButton()
        FloatingExitButton()
          .preferredColorScheme(.dark)

      }
    }
}
