//
//  InverColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct InvertColorsPage: View, Page {
  let title: String = L10n.InvertColors.title

  var body: some View {
    PageContent(next: IncreaseContrastPage()) {
      Group {
        intro
        whatToDo
        example
      }
      .toAny()
    }
  }
}

private extension InvertColorsPage {
  var intro: some View {
    Group {
      Text(L10n.InvertColors.Intro.text1)
      ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
      Text(L10n.InvertColors.Intro.text2)
      Text(L10n.InvertColors.Intro.text3)
      Text(L10n.InvertColors.Intro.text4)
      Comment(L10n.InvertColors.Intro.comment1)
      Text(L10n.InvertColors.Intro.text5)
      Text(L10n.InvertColors.Intro.text6)
      VerticalSpace(.regular)
    }
  }

  var whatToDo: some View {
    Group {
      Title(L10n.InvertColors.WhatToDo.title)
      Text(L10n.InvertColors.WhatToDo.text1)
      Text(L10n.InvertColors.WhatToDo.text2)
      Code.uikit(
        """
        myView.accessibilityIgnoresInvertColors = true
        """
      )
      Code.swiftUI(
        """
        View()
        .accessibilityIgnoresInvertColors()
        """
      )
    }
  }

  var example: some View {
    Group {
      VerticalSpace(.regular)
      Text(L10n.InvertColors.Example.text1)
      Centered {
        HStack(spacing: .regular) {
          Asset.starryNight.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .accessibilityLabel(L10n.InvertColors.Example.image1)

          Asset.starryNight.swiftUIImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .accessibilityIgnoresInvertColors()
            .accessibilityLabel(L10n.InvertColors.Example.image2)
        }
        .toAny()
      }
      Comment(L10n.InvertColors.Example.comment)
      DocButton(link: "https://developer.apple.com/documentation/uikit/uiview/2865843-accessibilityignoresinvertcolors", title: title)
    }
  }
}
