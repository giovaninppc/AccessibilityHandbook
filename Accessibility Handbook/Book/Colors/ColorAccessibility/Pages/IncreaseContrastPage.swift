//
//  IncreaseContrastPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct IncreaseContrastPage: View, Page {
  var title: String = L10n.IncreaseContrast.title

  let link = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitycontrast
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        property
        swiftUI

      }
      .toAny()
    }
  }
}

private extension IncreaseContrastPage {
  var intro: some View {
    Group {
      Text(L10n.IncreaseContrast.Intro.text1)
      ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
      Text(L10n.IncreaseContrast.Intro.text2)
    }
  }

  var property: some View {
    Group {
      Title(L10n.IncreaseContrast.Property.title)
      Text(L10n.IncreaseContrast.Property.text1)
      Comment(L10n.IncreaseContrast.Property.comment1)
      Text(L10n.IncreaseContrast.Property.text2)
      Code.uikit(
        """
        if UIAccessibility.accessibilityDisplayShouldIncreaseContrast {
          // Handle
        }
        """
      )
      DocButton(link: link, title: title)
      VerticalSpace(.regular)
    }
  }

  var swiftUI: some View {
    Group {
      Text(L10n.IncreaseContrast.SwiftUI.text1)
      VerticalSpace(.regular)
      example
      VerticalSpace(.regular)
      Code.swiftUI(
        """
        View()
        .contrast(<Double>)
        """
      )
      Comment(L10n.IncreaseContrast.SwiftUI.comment1)
      DocButton(link: "https://developer.apple.com/documentation/swiftui/view/contrast(_:)/", title: title)
    }
  }

  var example: some View {
    Centered {
      ForEach(-1..<5) {
      Color.red.frame(width: 50, height: 50, alignment: .center)
        .overlay(circle, alignment: .center)
        .contrast(Double($0) * 0.25)
        .overlay(Text("\(Double($0) * 0.25 * 100, specifier: "%.0f")%")
          .font(.callout.bold()),
           alignment: .bottom)
        .border(Color.gray)
      }
      .toAny()
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(L10n.IncreaseContrast.example)
  }

  var circle: some View {
    Circle()
      .fill(Color.green)
      .frame(width: 25, height: 25, alignment: .center)
  }
}

