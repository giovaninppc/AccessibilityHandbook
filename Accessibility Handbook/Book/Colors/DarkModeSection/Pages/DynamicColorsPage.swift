//
//  DynamicColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct DynamicColorsPage: View, Page {
  let title: String = L10n.DynamicColors.title

  var body: some View {
    PageContent(next: DynamicColoredAssetsPage()) {
      Group {
        intro
        systemColors
        customColors
      }
      .toAny()
    }
  }
}

private extension DynamicColorsPage {
  var intro: some View {
    Group {
      Text(L10n.DynamicColors.Intro.text1)
    }
  }

  var systemColors: some View {
    Group {
      Title(L10n.DynamicColors.SystemColors.title)
      Text(L10n.DynamicColors.SystemColors.text1)
      Text(L10n.DynamicColors.SystemColors.text2)
      Code.uikit(
        """
        let label = UILabel()
        label.textColor = UIColor.label
        label.backgroundColor = UIColor.background
        """
      )
      Code.swiftUI(
        """
        Text("")
          .foregroundColor(.primary)
          .background(Color.background)
        """
      )
      Text(L10n.DynamicColors.SystemColors.text3)
      systemColorsExample
      Comment(L10n.DynamicColors.SystemColors.comment1)
      Code.swiftUI(
        """
        extension Color {
          static var systemRed: Color {
            Color(uiColor: .systemRed)
          }
        }
        """
      )
    }
  }

  var systemColorsExample: some View {
    VStack {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          colorPreview(color: .primary, name: "primary")
          colorPreview(color: .background, name: "background")
          colorPreview(color: .init(.systemRed), name: "systemRed")
          colorPreview(color: .init(.systemBlue), name: "systemBlue")
          colorPreview(color: .init(.systemGreen), name: "systemGreen")
          colorPreview(color: .init(.systemYellow), name: "systemYellow")
          colorPreview(color: .init(.systemPink), name: "systemPink")
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

  var customColors: some View {
    Group {
      Title(L10n.DynamicColors.CustomColors.title)
      Text(L10n.DynamicColors.CustomColors.text1)
      Comment(L10n.DynamicColors.CustomColors.comment1)
      InternalLink(page: DynamicColoredAssetsPage().page, title: L10n.DynamicContent.title)
      Text(L10n.DynamicColors.CustomColors.text2)
      code
      Text(L10n.DynamicColors.CustomColors.text5)
      InternalLink(page: AppearancesPage().page, title: L10n.Appearances.title)
    }
  }

  var code: some View {
    Group {
      Text(L10n.DynamicColors.CustomColors.text3)
      Code.uikit(
        """
        extension UIColor {
          static var myColor: UIColor {
            UIColor { (traitCollection: UITraitCollection) -> UIColor in
              if traitCollection.userInterfaceStyle == .dark {
                return Colors.myColorDarkMode
              } else {
                return Colors.myColorLightMode
              }
            }
          }
        }
        """
      )
      Text(L10n.DynamicColors.CustomColors.text4)
      Code.swiftUI(
        """
        @Environment(\\.colorScheme)
        var colorScheme

        var body: some View {
          Text("")
            .foregroundColor(myColor)
        }

        var myColor: Color {
          switch colorScheme {
          case .light:
            return Colors.myColorLightMode
          case .dark:
            return Colors.myColorDarkMode
          }
        }
        """
      )
    }
  }
}
