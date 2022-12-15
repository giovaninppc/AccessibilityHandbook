//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct FigureDifferentFontScalesPage: View, Page {
  let title: String = L10n.FigureDifferentFontScales.title

  var body: some View {
    PageContent(next: IsItAModalPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        test
        link
      }
      .toAny()
    }
  }
}

private extension FigureDifferentFontScalesPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.DynamicFonts.title, destination: IndexView.dynamicFontsDeeplink())
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.FigureDifferentFontScales.text1)
    Text(L10n.FigureDifferentFontScales.text2)
    Comment(L10n.FigureDifferentFontScales.comment1)
  }

  @ViewBuilder
  var test: some View {
    Title(L10n.FigureDifferentFontScales.Test.title)
    Text(L10n.FigureDifferentFontScales.Test.text1)
    Text(L10n.FigureDifferentFontScales.Test.text2)
    Text(L10n.FigureDifferentFontScales.Test.text3)
    Comment(L10n.FigureDifferentFontScales.Test.comment1)
  }

  var link: some View {
    InternalLink(deeplink: AdjustLayoutToScaledFontPage().deeplink, title: L10n.AdjustLayoutToScaledFontPage.title)
  }
}
