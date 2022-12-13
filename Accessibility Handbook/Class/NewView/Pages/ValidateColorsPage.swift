//
//  HandleAllTheViewActions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct ValidateColorsPage: View, Page {
  let title: String = L10n.ValidateColors.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
      }
      .toAny()
    }
  }
}

private extension ValidateColorsPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.ValidateColors.text1)
    Text(L10n.ValidateColors.text2)
    Comment(L10n.ValidateColors.comment1)
    Text(L10n.ValidateColors.text3)
  }
}
