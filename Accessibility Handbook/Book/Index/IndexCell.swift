//
//  HomeCell.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct IndexCell: View {
  let title: String

  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      HStack {
        Text(title)
          .font(.body)
          .padding(.horizontal, .regular)
          .padding(.vertical, .regular)
        Spacer()
        Image(systemName: "chevron.forward")
          .padding()
      }
      Rectangle()
        .frame(height: 1.0)
        .foregroundColor(.secondaryBackground)
    }
    .accessibilityElement(children: .combine)
    .accessibilityAddTraits(.isButton)
  }
}

// MARK: - Preview

struct HomeCell_Previews: PreviewProvider {
  static var previews: some View {
    IndexCell(title: "Some item")
  }
}
