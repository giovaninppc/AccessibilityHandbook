//
//  AboutColors.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AboutColorsPage: View, Page {
  var title: String = L10n.AboutColors.title

  var body: some View {
    PageContent(next: ColorBlindnessPage()) {
      Group {
        Text(L10n.AboutColors.text1)
        Comment(L10n.AboutColors.comment1)
        Asset.prettyColors.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .accessibilityLabel(L10n.AboutColors.image)
        Text(L10n.AboutColors.text2)
        Comment(L10n.AboutColors.comment2)
        Text(L10n.AboutColors.text3)
        Text(L10n.AboutColors.text4)
        Comment(L10n.AboutColors.comment3)
        DocButton(
          link: "https://developer.apple.com/design/human-interface-guidelines/foundations/color/",
          title: L10n.AboutColors.higColors
        )
      }
      .toAny()
    }
  }
}
