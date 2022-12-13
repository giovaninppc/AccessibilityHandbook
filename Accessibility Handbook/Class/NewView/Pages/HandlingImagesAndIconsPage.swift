//
//  HandlingImagesAndIconsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HandlingImagesAndIconsPage: View, Page {
  let title: String = L10n.ImagesAndIcons.title

  var body: some View {
    PageContent(next: AddTheCorrectTraitsPage(), deeplink: deeplink) {
      Group {
        intro
        icons
        images
        hidingImages
      }
      .toAny()
    }
  }
}

private extension HandlingImagesAndIconsPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.ImagesAndIcons.text1)
  }

  @ViewBuilder
  var icons: some View {
    Title(L10n.ImagesAndIcons.Icons.title)
    Text(L10n.ImagesAndIcons.Icons.text1)
    Text(L10n.ImagesAndIcons.Icons.text2)
    tabItem
    Text(L10n.ImagesAndIcons.Icons.text3)
    Code.swiftUI("""
    Image(imageAsset)
      .accessibilityHidden(true)
    """)
    Code.uikit("""
    let image = UIImageView(named: "iconName")
    image.isAccessibilityElement = false
    """)
    Text(L10n.ImagesAndIcons.Icons.text4)
    iconWithAlternateTextExample
  }

  @ViewBuilder
  var images: some View {
    Title(L10n.ImagesAndIcons.Images.title)
    Text(L10n.ImagesAndIcons.Images.text1)
    Text(L10n.ImagesAndIcons.Images.text2)
    Comment(L10n.ImagesAndIcons.Images.comment1)
    Text(L10n.ImagesAndIcons.Images.text3)
    Comment(L10n.ImagesAndIcons.Images.comment2)
    imageExample
  }

  @ViewBuilder
  var hidingImages: some View {
    Title(L10n.ImagesAndIcons.HideImage.title)
    Text(L10n.ImagesAndIcons.HideImage.text1)
    Text(L10n.ImagesAndIcons.HideImage.text2)
    Text(L10n.ImagesAndIcons.HideImage.text3)
    imageCarousel
    Comment(L10n.ImagesAndIcons.HideImage.comment1)
  }
}

private extension HandlingImagesAndIconsPage {
  @ViewBuilder
  var tabItem: some View {
    VerticalSpace(.regular)
    Centered {
      HStack(spacing: .regular) {
        tabItem(icon: Icon.book, title: L10n.book)
        tabItem(icon: Icon.search, title: L10n.search)
        tabItem(icon: Icon.cloud, title: L10n.cloud)
        tabItem(icon: Icon.person, title: L10n.example)
      }
      .frame(minWidth: 300.0, maxWidth: 400.0)
      .padding()
      .hierarchyBackground(color: .secondaryBackground)
      .toAny()
    }
    VerticalSpace(.regular)
    Comment(L10n.ImagesAndIcons.Icons.comment1)
  }

  func tabItem(icon: Image, title: String) -> some View {
    Button {
      //
    } label: {
      VStack(alignment: .center, spacing: .compact) {
        icon
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 20.0, height: 20.0)
          .accessibilityHidden(true)
        Text(title)
      }
    }
    .accessibilityElement(children: .combine)
  }

  @ViewBuilder
  var iconWithAlternateTextExample: some View {
    VerticalSpace(.regular)
    Centered {
      Button {
        //
      } label: {
        Icon.lightbulb
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 25.0, height: 25.0)
      }
      .accessibilityElement(children: .combine)
      .accessibilityLabel(L10n.ImagesAndIcons.Icons.icon)
      .accessibilityHint(L10n.ImagesAndIcons.Icons.iconHint)
      .toAny()
    }
    VerticalSpace(.regular)
  }

  @ViewBuilder
  var imageExample: some View {
    VerticalSpace(.regular)
    Asset.starryNight.swiftUIImage
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(maxWidth: 350.0)
      .accessibilityLabel(L10n.RotorExample.starryNight)
      .accessibilityAddTraits(.isImage)
    VerticalSpace(.regular)
  }

  @ViewBuilder
  var imageCarousel: some View {
    VerticalSpace(.regular)
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: .regular) {
        cell(title: L10n.RotorExample.starryNight, image: Asset.starryNight.swiftUIImage)
        cell(title: L10n.RotorExample.sunflower, image: Asset.sunflower.swiftUIImage)
        cell(title: L10n.RotorExample.vanGoghImage, image: Asset.vanGogh.swiftUIImage)
      }
    }
    VerticalSpace(.regular)
  }

  func cell(title: String, image: Image) -> some View {
    VStack(alignment: .center, spacing: .regular) {
      image
        .resizable()
        .frame(width: 160.0, height: 100)
        .scaledToFill()
        .clipped()
        .accessibilityHidden(true)
      Text(title)
        .padding()
        .fixedSize(horizontal: false, vertical: true)
    }
    .frame(width: 160.0)
    .padding(.bottom)
    .clipped()
    .hierarchyBackground(color: .secondary)
    .accessibilityElement(children: .combine)
  }
}
