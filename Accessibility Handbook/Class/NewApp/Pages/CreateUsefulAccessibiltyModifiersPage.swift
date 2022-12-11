//
//  CreateAFontFile.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAccessibilityModifiersPage: View, Page {
  let title: String = L10n.CreateAccessibilityModifiers.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        reusingAccessibility
      }
      .toAny()
    }
  }
}

private extension CreatingAccessibilityModifiersPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.CreateAccessibilityModifiers.text1)
    Comment(L10n.CreateAccessibilityModifiers.comment1)
    Text(L10n.CreateAccessibilityModifiers.text2)
  }

  @ViewBuilder
  var reusingAccessibility: some View {
    Title(L10n.CreateAccessibilityModifiers.ReusingAccessibility.title)
  }
}
