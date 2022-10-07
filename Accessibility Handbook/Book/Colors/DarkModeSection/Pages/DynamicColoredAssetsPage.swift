//
//  DynamicContentPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct DynamicColoredAssetsPage: View, Page {
  let title: String = L10n.DynamicContent.title

  var body: some View {
    PageContent(next: TintableImagesPage()) {
      Group {
        intro
        assets
        doc
      }
      .toAny()
    }
  }
}

private extension DynamicColoredAssetsPage {
  var intro: some View {
    Group {
      Text(L10n.DynamicContent.Intro.text1)
      Text(L10n.DynamicContent.Intro.text2)
    }
  }

  var assets: some View {
    Group {
      Title(L10n.DynamicContent.XCTAssets.title)
      Text(L10n.DynamicContent.XCTAssets.text1)
      Text(L10n.DynamicContent.XCTAssets.text2)
      Asset.xcAssetscolorScheme.swiftUIImage
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(maxWidth: 400.0)
        .accessibilityHidden(true)
      Comment(L10n.DynamicContent.XCTAssets.image1)
      Text(L10n.DynamicContent.XCTAssets.text3)
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uiimage/providing_images_for_different_appearances", title: L10n.TintableImages.doc)
  }
}
