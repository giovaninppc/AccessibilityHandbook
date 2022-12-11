//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAColorFilePage: View, Page {
  let title: String = L10n.CreateAColorFile.title

  var body: some View {
    PageContent(next: CreatingAFontFilePage(), deeplink: deeplink) {
      Group {
        intro
        colors
        centralizedColorDocument
      }
      .toAny()
    }
  }
}

private extension CreatingAColorFilePage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.CreateAColorFile.text1)
    Text(L10n.CreateAColorFile.text2)
    Text(L10n.CreateAColorFile.text3)
    Text(L10n.CreateAColorFile.text4)
  }

  @ViewBuilder
  var colors: some View {
    colorPallete(
      description: L10n.CreateAColorFile.colors,
      colors:
      color(red: 34, green: 51, blue: 102),
      color(red: 55, green: 82, blue: 166),
      color(red: 67, green: 101, blue: 204),
      color(red: 75, green: 115, blue: 230),
      color(red: 80, green: 121, blue: 242)
    )
  }

  @ViewBuilder
  var centralizedColorDocument: some View {
    Title(L10n.CreateAColorFile.CentralizedColor.title)
    Text(L10n.CreateAColorFile.CentralizedColor.text1)
    Comment(L10n.CreateAColorFile.CentralizedColor.comment1)
    Text(L10n.CreateAColorFile.CentralizedColor.text2)

    Code.swiftUI("""
    public enum CompanyColors {
      public static var textColor: Color {
        .init(red: 0.1, green: 0.1, blue: 0.1)
      }

      public static var background: Color {
        .init(red: 1, green: 1, blue: 1)
      }

      public static var highlight: Color {
        .init(red: 0.95, green: 0.2, blue: 0.188)
      }

      public static var promotion: Color {
        .init(red: 0.255, green: 0.949, blue: 0.443)
      }
    }
    """)

    colorPallete(
      description: L10n.CreateAColorFile.CentralizedColor.colors,
      colors:
        color(red: 25, green: 25, blue: 25),
        color(red: 255, green: 255, blue: 255),
        color(red: 242, green: 52, blue: 48),
        color(red: 65, green: 242, blue: 113)
    )

    Text(L10n.CreateAColorFile.CentralizedColor.text3)
  }

  func color(red: Double, green: Double, blue: Double) -> Color {
    .init(red: red/255.0, green: green/255.0, blue: blue/255.0)
  }

  @ViewBuilder
  func colorPallete(description: String, colors: Color...) -> some View {
    HStack(alignment: .center, spacing: .regular) {
      Spacer()
      ForEach(colors, id: \.self) { color in
        Circle()
          .foregroundColor(color)
      }
      Spacer()
    }
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
    Centered {
      Comment(description)
        .multilineTextAlignment(.center)
        .toAny()
    }
  }
}
