//
//  Disclaimer.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import SwiftUI

struct Disclaimer: View {
  let icon: Image
  let content: String?
  let attributedContent: AttributedString?
  let color: Color

  init(icon: Image = Icon.exclamation, content: String? = nil, attributedContent: AttributedString? = nil, color: Color = .yellow) {
    self.icon = icon
    self.content = content
    self.color = color
    self.attributedContent = attributedContent
  }

  var body: some View {
    HStack(alignment: .center) {
      VStack {
        icon
          .foregroundColor(.primary)
          .frame(width: 20.0, height: 20.0)
          .accessibilityHidden(true)
      }
      .padding(.vertical)
      .padding(.horizontal, .compact)
      if let content = content {
        Text(content)
          .font(.callout)
          .fixedSize(horizontal: false, vertical: true)
      }
      if let attributedContent = attributedContent {
        Text(attributedContent)
          .font(.callout)
          .foregroundColor(.primary)
          .multilineTextAlignment(.leading)
          .fixedSize(horizontal: false, vertical: true)
      }
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

extension Disclaimer {
  static func beforeYouReadThis(check page: String, destination: Deeplink) -> some View {
    VStack(alignment: .leading, spacing: .regular) {
      Button {
        open(destination)
      } label: {
        Disclaimer(icon: Icon.bookshelf, attributedContent: beforeYouReadContent(page), color: .pink)
      }
      .accessibilityElement(children: .combine)
    }
  }

  private static func beforeYouReadContent(_ page: String) -> AttributedString {
    var attributedString = AttributedString(stringLiteral: L10n.LearnAccessibility.beforeYouReadThis)
    var button = AttributedString(page)
    button.underlineStyle = Text.LineStyle(pattern: .solid, color: .primary)
    attributedString.append(button)
    return attributedString
  }

  private static func open(_ page: Deeplink) {
    guard let url = URL(string: page) else { return }
    UIApplication.shared.open(url)
  }
}
