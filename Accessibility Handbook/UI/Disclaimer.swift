//
//  Disclaimer.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import SwiftUI

struct Disclaimer: View {
  let icon: Image
  let content: String
  let color: Color

  init(icon: Image = Icon.exclamation, content: String, color: Color = .yellow) {
    self.icon = icon
    self.content = content
    self.color = color
  }

  var body: some View {
    HStack(alignment: .center) {
      VStack {
        icon
          .frame(width: 20.0, height: 20.0)
          .accessibilityHidden(true)
        Spacer()
      }
      .padding()
      Text(content)
        .font(.callout)
      Spacer()
    }
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(color)
        .opacity(0.2)
    }
  }
}
