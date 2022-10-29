//
//  ScalingFontsAutomaticallyPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct ScallingFontsAutomaticallyPage: View, Page {
  let title: String = L10n.ImplementingDynamicFonts.title

  var body: some View {
    PageContent(next: UIFontMetricsPage(), deeplink: deeplink) {
      Group {
        intro
        textStyles
        systemFonts
      }
      .toAny()
    }
  }
}

private extension ScallingFontsAutomaticallyPage {
  var intro: some View {
    Group {
      Text(L10n.ImplementingDynamicFonts.Intro.text1)
      Comment(L10n.ImplementingDynamicFonts.Intro.comment1)
      Text(L10n.ImplementingDynamicFonts.Intro.text2)
      Code.uikit(
        """
        myLabel.font = UIFont(
            name: "MyFont",
            size: 36
        )
        """
      )
      Comment(L10n.ImplementingDynamicFonts.Intro.comment2)
    }
  }

  var textStyles: some View {
    Group {
      Title(L10n.ImplementingDynamicFonts.TextStyles.title)
      Text(L10n.ImplementingDynamicFonts.TextStyles.text1)
      Text(L10n.ImplementingDynamicFonts.TextStyles.text2)
      Code.uikit(
        """
        myLabel.font = UIFont.preferredFont(
            forTextStyle: .body
        )
        """
      )
      Comment(L10n.ImplementingDynamicFonts.TextStyles.comment1)
      Text(L10n.ImplementingDynamicFonts.TextStyles.text3)
    }
  }

  var systemFonts: some View {
    Group {
      Title(L10n.ImplementingDynamicFonts.SystemFonts.title)
      Text(L10n.ImplementingDynamicFonts.SystemFonts.text1)
      Code.uikit(
        """
        myLabel.adjustsFontForContentSizeCategory = true
        myLabel.font = UIFont.preferredFont(
            forTextStyle: .body
        )
        """
      )
      Code.swiftUI(
        """
        Text("...")
            .font(.body)
        """
      )
      Text(L10n.ImplementingDynamicFonts.SystemFonts.text2)
      Comment(L10n.ImplementingDynamicFonts.SystemFonts.comment1)
      DocButton(link: "https://developer.apple.com/documentation/uikit/uifont/scaling_fonts_automatically", title: title)
    }
  }
}
