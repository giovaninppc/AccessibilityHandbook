//
//  AccessibilityLabelPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityLabelPage: View, Page {
  static let strings = L10n.AccLabel.self

  let title: String = strings.title

  let codeUIKit: String = """
  myView.accessibilityLabel = "<content>"
  """

  let codeSwiftUI: String = """
  .accessibilityLabel(Text("<content>"))
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615181-accessibilitylabel
  """

  var body: some View {
    PageContent(next: AccessibilityHintPage()) {
      Group {
        Text(Self.strings.text1)
        Text(Self.strings.text2)
        Text(Self.strings.text3)
        exampleImage
        Text(Self.strings.text4)
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }

  private var exampleImage: some View {
    Image(uiImage: Asset.starryNight.image)
      .resizable()
      .padding()
      .aspectRatio(contentMode: .fit)
      .accessibilityLabel(Text(Self.strings.image))
  }
}
