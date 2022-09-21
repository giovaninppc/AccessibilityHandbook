//
//  AccessibilityElementPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityElementPage: View, Page {
  static let strings = L10n.AccElem.self

  let title: String = strings.title

  let codeUIKit: String = """
  myView.isAccessibilityElement = true
  """

  let codeSwiftUI: String = """
  .accessibilityHidden(false)
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615141-isaccessibilityelement
  """

  var body: some View {
    PageContent(next: AccessibilityLabelPage()) {
      Group {
        Text(Self.strings.text1)
        Text(Self.strings.text2)
        Text(Self.strings.text3)
        example
        Text(Self.strings.comment)
        Text(Self.strings.comment2)
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    VStack(spacing: .large) {
      Rectangle()
        .foregroundColor(.secondaryBackground)
        .frame(height: .single)
        .accessibilityHidden(true)
      HStack {
        Image(systemName: "circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
          .accessibilityHidden(false)
          .accessibilityLabel(Text(Self.strings.Example.isAccessibilityElement))

        Image(systemName: "circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
          .accessibilityHidden(true)
          .opacity(0.5)

        Image(systemName: "circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
          .accessibilityHidden(false)
          .accessibilityLabel(Text(Self.strings.Example.isAccessibilityElement))

        Image(systemName: "circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
          .accessibilityHidden(true)
          .opacity(0.5)

        Image(systemName: "circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
          .accessibilityHidden(false)
          .accessibilityLabel(Text(Self.strings.Example.isAccessibilityElement))
      }
      .foregroundColor(.accentColor)
      Rectangle()
        .foregroundColor(.secondaryBackground)
        .frame(height: .single)
        .accessibilityHidden(true)
    }
  }
}
