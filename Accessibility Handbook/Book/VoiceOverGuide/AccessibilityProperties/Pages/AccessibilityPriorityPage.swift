//
//  AccessibilityPriorityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AccessibilityPriorityPage: View, Page {
  let title: String = L10n.AccPriority.title

  let codeUIKit: String = """
  \(L10n.AccPriority.Code.uikitComment)
  myView.accessibilityElements =
    [subview1, subview2, subview3]
  """

  let codeSwiftUI: String = """
    \(L10n.AccPriority.Code.swiftUIComment)
  View()
    .accessibilitySortPriority(2)
  View()
    .accessibilitySortPriority(1)
  View()
    .accessibilitySortPriority(3)
  """

  let docLink: String = """
  https://developer.apple.com/documentation/swiftui/link/accessibilitysortpriority(_:)
  """

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        Text(L10n.AccPriority.text1)
          .accessibilitySortPriority(100)
        Text(L10n.AccPriority.text2)
          .accessibilitySortPriority(100)
        Text(L10n.AccPriority.text3)
          .accessibilitySortPriority(100)
        example
        Comment(L10n.AccPriority.comment1)
          .accessibilitySortPriority(-2)
        Comment(L10n.AccPriority.comment2)
          .accessibilitySortPriority(-2)
        Comment(L10n.AccPriority.comment3)
          .accessibilitySortPriority(-2)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
          .accessibilitySortPriority(-2)
        DocButton(link: docLink, title: title)
          .accessibilitySortPriority(-2)
      }
      .toAny()
    }
  }

  var example: some View {
    VStack(spacing: .regular) {
      VerticalSpace(.large)
      HStack {
        Text(L10n.weatherIcons)
          .font(.title3)
          .accessibilitySortPriority(10)
        Spacer()
        Button {
          UIAccessibility.post(notification: .announcement, argument: L10n.AccPriority.notification)
        } label: {
          Text(L10n.more)
        }
        .accessibilitySortPriority(-1)
      }
      HStack(spacing: .large) {
        Icon.moon
          .accessibilityLabel(Text(L10n.moon))
          .accessibilitySortPriority(9)
        Icon.cloud
          .accessibilityLabel(Text(L10n.cloud))
          .accessibilitySortPriority(8)
        Icon.sun
          .accessibilityLabel(Text(L10n.sun))
          .accessibilitySortPriority(7)
        Icon.sunrise
          .accessibilityLabel(Text(L10n.sunrise))
          .accessibilitySortPriority(6)
        Icon.cloudSnow
          .accessibilityLabel(Text(L10n.snow))
          .accessibilitySortPriority(5)
        Icon.rainBolt
          .accessibilityLabel(Text(L10n.rain))
          .accessibilitySortPriority(4)
        Icon.cloudFog
          .accessibilityLabel(Text(L10n.fog))
          .accessibilitySortPriority(3)
      }
      VerticalSpace(.large)
    }
    .padding()
  }
}
