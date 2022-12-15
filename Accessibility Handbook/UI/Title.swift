//
//  Title.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct Title: View {
  let text: String

  init(_ text: String) {
    self.text = text
  }

  var body: some View {
    Text(text)
      .font(.title2.bold())
      .foregroundColor(.primary)
      .accessibilityAddTraits(.isHeader)
      .padding(.top)
  }
}
