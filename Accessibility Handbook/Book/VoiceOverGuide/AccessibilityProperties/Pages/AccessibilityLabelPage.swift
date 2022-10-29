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

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615181-accessibilitylabel
  """

  var body: some View {
    PageContent(next: AccessibilityHintPage(), deeplink: deeplink) {
      Group {
        heading
        exampleImage
        Comment(Self.strings.comment)
        Code.uikit(
          """
          myView.accessibilityLabel = "content"
          """
        )
        Code.swiftUI(
          """
          View()
          .accessibilityLabel("content")
          """
        )
        VerticalSpace(.regular)
        Text(Self.strings.text4)
        Centered {
          Text(Self.strings.example)
            .font(.title2)
            .accessibilityLabel(Self.strings.accessibilityLabelExample)
            .toAny()
        }
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

extension AccessibilityLabelPage {
  var heading: some View {
    Group {
      Text(Self.strings.text1)
      Text(Self.strings.text2)
      Text(Self.strings.text3)
    }
  }
}
