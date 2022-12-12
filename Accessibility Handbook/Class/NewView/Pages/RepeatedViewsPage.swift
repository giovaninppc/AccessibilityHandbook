//
//  RepeatedViewsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct RepeatedViewsPage: View, Page {
  let title: String = L10n.RepeatedViews.title

  var body: some View {
    PageContent(next: HandlingImagesAndIconsPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        example
      }
      .toAny()
    }
  }
}

private extension RepeatedViewsPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.Grouping.title, destination: GroupingPage().page)
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.RepeatedViews.text1)
    Text(L10n.RepeatedViews.text2)
    Text(L10n.RepeatedViews.text3)
    Text(L10n.RepeatedViews.text4)
    Text(L10n.RepeatedViews.text5)
    VerticalSpace(.large)
  }

  @ViewBuilder
  var example: some View {
    badCarousel
    VerticalSpace(.large)
    goodCarousel
    Text(L10n.RepeatedViews.text6)
  }
}

private extension RepeatedViewsPage {
  @ViewBuilder
  var badCarousel: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: .regular) {
        ForEach(1...7, id: \.self) { _ in
          badCell()
        }
      }
    }
    Comment(L10n.RepeatedViews.example1)
    Code.swiftUI("""
    VStack {
      Image(imageAsset)
      Text("Title label")
      Text("Subtitle label")
    }
    """)
  }

  func badCell() -> some View {
    VStack(spacing: .regular) {
      Text("Image")
        .padding(.horizontal)
        .padding(.vertical, .large)
        .hierarchyBackground()
        .border(.primary, width: 2.0)
      Text("Title label")
        .padding()
        .hierarchyBackground()
        .border(.primary, width: 2.0)
      Text("Subtitle label")
        .padding()
        .hierarchyBackground()
        .border(.primary, width: 2.0)
    }
    .padding()
    .hierarchyBackground()
    .frame(minWidth: 200.0, maxWidth: 350.0)
  }

  @ViewBuilder
  var goodCarousel: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: .regular) {
        ForEach(1...7, id: \.self) { _ in
          goodCell()
        }
      }
    }
    Comment(L10n.RepeatedViews.example2)
    Code.swiftUI("""
    VStack {
      Image(imageAsset)
      Text("Title label")
      Text("Subtitle label")
    }
    .accessibilityElement(children: .combine)
    """)
  }

  func goodCell() -> some View {
    VStack(spacing: .regular) {
      Text("Image")
        .padding(.horizontal)
        .padding(.vertical, .large)
        .hierarchyBackground()
      Text("Title label")
        .padding()
        .hierarchyBackground()
      Text("Subtitle label")
        .padding()
        .hierarchyBackground()
    }
    .padding()
    .hierarchyBackground()
    .border(.primary, width: 2.0)
    .accessibilityElement(children: .combine)
    .frame(minWidth: 200.0, maxWidth: 350.0)
  }
}
