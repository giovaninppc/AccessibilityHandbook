//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAColorFilePage: View, Page {
  let title: String = L10n.CreateAColorFile.title

  @Environment(\.colorScheme)
  var colorScheme

  var body: some View {
    PageContent(next: CreatingAFontFilePage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        colors
        centralizedColorDocument
        darkMode
        increaseContrast
      }
      .toAny()
    }
  }
}

private extension CreatingAColorFilePage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.ColorsGuide.title, destination: IndexView(sections: ColorsSection()).toAny())
  }

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
    Comment(L10n.CreateAColorFile.CentralizedColor.disclaimer)
  }

  @ViewBuilder
  var darkMode: some View {
    Title(L10n.CreateAColorFile.DarkMode.title)
    Text(L10n.CreateAColorFile.DarkMode.text1)
    InternalLink(
      page: DynamicColorsPage().page,
      title: L10n.CreateAColorFile.DarkMode.button1
    )

    Code.uikit("""
    public static var textColor: UIColor {
      UIColor { (tC: UITraitCollection) -> UIColor in
        switch tC.userInterfaceStyle {
         case .dark:
           return .init(red: 1.0, green: 1.0, blue: 1.0)
         default:
           return .init(red: 0.1, green: 0.1, blue: 0.1)
        }
      }
    }

    public static var background: UIColor {
      UIColor { (tC: UITraitCollection) -> UIColor in
        switch tC.userInterfaceStyle {
          case .dark:
            return .init(red: 0.0, green: 0.0, blue: 0.0)
          default:
            return .init(red: 1.0, green: 1.0, blue: 1.0)
        }
      }
    }
    """)

    colorPallete(
      description: L10n.CreateAColorFile.DarkMode.colors,
      colors:
      (colorScheme == .dark ? color(red: 255, green: 255, blue: 255) : color(red: 25, green: 25, blue: 25)),
      (colorScheme == .dark ? color(red: 0, green: 0, blue: 0) : color(red: 255, green: 255, blue: 255)),
      (colorScheme == .dark ? color(red: 242, green: 52, blue: 48) : color(red: 200, green: 30, blue: 30)),
      (colorScheme == .dark ? color(red: 65, green: 242, blue: 113) : color(red: 60, green: 210, blue: 90))
    )
  }

  @ViewBuilder
  var increaseContrast: some View {
    Title(L10n.CreateAColorFile.IncreaseContrast.title)
    Text(L10n.CreateAColorFile.IncreaseContrast.text1)
    Text(L10n.CreateAColorFile.IncreaseContrast.text2)
    Code.uikit("""
    public static var textColor: UIColor {
      UIColor { (tC: UITraitCollection) -> UIColor in
        switch tC.userInterfaceStyle {
         case .dark:
           return UIAccessibility.accessibilityDisplayShouldIncreaseContrast
             ? .init(red: 1.0, green: 1.0, blue: 1.0)
             : .init(red: 1.0, green: 1.0, blue: 1.0)
         default:
           return UIAccessibility.accessibilityDisplayShouldIncreaseContrast
           ? .init(red: 0.1, green: 0.1, blue: 0.1)
           : .init(red: 0.0, green: 0.0, blue: 0.0)
        }
      }
    }
    """)
    InternalLink(page: IncreaseContrastPage().page, title: L10n.CreateAColorFile.IncreaseContrast.button)
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
          .frame(maxWidth: 50.0)
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
