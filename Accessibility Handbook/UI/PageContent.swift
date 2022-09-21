//
//  PageContent.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct PageContent: View {
  let next: Page?
  let content: () -> AnyView

  @Environment(\.dismiss) var dismiss

  var body: some View {
    VStack {
      ScrollView {
        VStack(alignment: .leading, spacing: .regular) {
          content()
        }
        .padding()
      }
      HStack {
        Spacer()
        if let next = next {
          NavigationLink {
            next.page
          } label: {
            NextPageButton(title: next.title)
          }
          .accessibilityElement(children: .combine)
          .accessibilityLabel(L10n.nextPage(next.title))
        }
      }
      .padding()
    }
  }
}

struct NextPageButton: View {
  let title: String?

  var body: some View {
    if let title = title {
      HStack {
        Text(title)
        Image(systemName: "arrow.right")
      }
    }
  }
}
