//
//  CreateAFontFile.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAFontFilePage: View, Page {
  let title: String = L10n.CreateAFontFile.title

  var body: some View {
    PageContent(next: CreatingAccessibilityModifiersPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        fontCategories
      }
      .toAny()
    }
  }
}

private extension CreatingAFontFilePage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(
      check: L10n.DynamicFonts.title,
      destination: IndexView.dynamicFonts().toAny()
    )
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.CreateAFontFile.text1)
    Text(L10n.CreateAFontFile.text2)
    Comment(L10n.CreateAFontFile.comment1)
  }

  @ViewBuilder
  var fontCategories: some View {
    Title(L10n.CreateAFontFile.FontCategories.title)
    Text(L10n.CreateAFontFile.FontCategories.text1)
    Text(L10n.CreateAFontFile.FontCategories.text2)
    Text(L10n.CreateAFontFile.FontCategories.text3)
  }
}
