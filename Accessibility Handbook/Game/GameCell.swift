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
        (completed ? Icon.checkmark : Icon.circle)
          .padding()
      }
      Rectangle()
        .frame(height: 1.0)
        .foregroundColor(.secondaryBackground)
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(title)
    .accessibilityHint(completed ? L10n.GameCell.finishedHint : L10n.GameCell.unfinishedHint)
    .accessibilityAddTraits(.isButton)
  }
}
