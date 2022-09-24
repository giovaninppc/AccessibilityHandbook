//
//  AccessibilityHintPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityHintPage: View, Page {
  static let strings = L10n.AccHint.self

  let title: String = strings.title

  let codeUIKit: String = """
  myView.accessibilityHint = "content"
  """

  let codeSwiftUI: String = """
  .accessibilityHint("content")
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615093-accessibilityhint
  """

  var body: some View {
    PageContent(next: AccessibilityTraitPage()) {
      Group {
        Text(Self.strings.text1)
        Text(Self.strings.text2)
        Text(Self.strings.text3)
        exampleCell
        Comment(Self.strings.comment)
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }

  private var exampleCell: some View {
    HStack {
      Spacer()
      VStack(spacing: .small) {
        Text(Self.strings.Example.title)
          .font(.body.bold())
        Text(Self.strings.Example.message)
          .font(.callout)
        Text(Self.strings.Example.footer)
          .foregroundColor(.tertiaryLabel)
          .font(.caption.bold())
      }
      .accessibilityElement(children: .combine)
      .accessibilityHint(Text(Self.strings.Example.hint))
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
      .onLongPressGesture {
        UIPasteboard.general.string = "123456"
        UIAccessibility.post(notification: .announcement, argument: Self.strings.Example.notification)
      }
      Spacer()
    }
  }
}
