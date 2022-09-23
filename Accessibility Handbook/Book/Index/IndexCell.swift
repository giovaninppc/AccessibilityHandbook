//
//  HomeCell.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct IndexCell: View {
  let title: String
  let icon: String?

  init(title: String, icon: String? = nil) {
    self.title = title
    self.icon = icon
  }

  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      HStack {
        displayTitle
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

  private var displayTitle: some View {
    Group {
      if let icon = icon {
        (Text(Image(systemName: icon)) + Text(" ") + Text(title))
      } else {
        Text(title)
      }
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(title)
  }
}

// MARK: - Preview

struct HomeCell_Previews: PreviewProvider {
  static var previews: some View {
    IndexCell(title: "Some item")
  }
}
