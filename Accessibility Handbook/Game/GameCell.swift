//
//  GameCell.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct GameCell: View {
  let title: String
  let completed: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      HStack {
        Text(title)
          .font(.body)
          .padding(.horizontal, .regular)
          .padding(.vertical, .regular)
        Spacer()
        Image(systemName: completed ? "checkmark.circle.fill" : "circle")
          .padding()
      }
      Rectangle()
        .frame(height: 1.0)
        .foregroundColor(.secondaryBackground)
    }
    .accessibilityElement(children: .combine)
    .accessibilityHint(Text(completed ? "You have already succeeded in this puzzle!" : "You haven't finished this puzzle yet"))
    .accessibilityAddTraits(.isButton)
  }
}
