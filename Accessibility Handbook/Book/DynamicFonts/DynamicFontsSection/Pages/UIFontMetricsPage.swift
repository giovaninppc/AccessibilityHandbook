//
//  UIFontMetricsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 28/09/22.
//

import SwiftUI

struct UIFontMetricsPage: View, Page {
  let title: String = L10n.UIFontMetrics.title

  var body: some View {
    PageContent(next: AdjustLayoutToScaledFontPage()) {
      Group {
        intro
      }
      .toAny()
    }
  }
}

private extension UIFontMetricsPage {
  var intro: some View {
    Group {
      Text(L10n.UIFontMetrics.Intro.text1)
      Text(L10n.UIFontMetrics.Intro.text2)
      Code.uikit(
      """
      guard let customFont = UIFont(
        name: "MyFont",
        size: UIFont.labelFontSize)
      else {
        // Unable to load font
      }

      label.font = UIFontMetrics(
        forTextStyle: .title
      ).scaledFont(for: customFont)

      label.adjustsFontForContentSizeCategory = true
      """
      )
      Comment(L10n.UIFontMetrics.Intro.comment1)
      DocButton(link: "https://developer.apple.com/documentation/uikit/uifontmetrics", title: title)
    }
  }
}
