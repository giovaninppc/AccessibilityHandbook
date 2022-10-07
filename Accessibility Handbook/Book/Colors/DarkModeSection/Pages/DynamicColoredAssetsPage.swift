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
      Text(L10n.DynamicContent.XCTAssets.text4)
      examples
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uiimage/providing_images_for_different_appearances", title: L10n.TintableImages.doc)
  }

  var examples: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          colorPreview(color: Asset.spookyBackground.swiftUIColor, name: "Spooky background")
          colorPreview(color: Asset.neonHighlight.swiftUIColor, name: "neon highlights")
          colorPreview(color: Asset.unlimitedFire.swiftUIColor, name: "unlimited fire")
        }
      }
    }
  }

  @ViewBuilder
  func colorPreview(color: Color, name: String) -> some View {
    VStack {
      RoundedRectangle(cornerRadius: 4.0)
        .foregroundColor(color)
        .frame(width: 50.0, height: 50.0)
      Comment(name)
    }
    .frame(minWidth: 100.0)
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel([L10n.example, name].joined(separator: .commaSpace))
  }
}
