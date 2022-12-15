//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct TryItYourselfPage: View, Page {
  let title: String = L10n.TryItYourself.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        Text(L10n.TryItYourself.text1)
        Text(L10n.TryItYourself.text2)
        Text(L10n.TryItYourself.text3)
        Text(L10n.TryItYourself.text4)
        Text(L10n.TryItYourself.text5)
        Text(L10n.TryItYourself.text6)
        Comment(L10n.TryItYourself.comment1)
        Divider()
        Text(L10n.TryItYourself.text7)
        Text(L10n.TryItYourself.text8)
      }
      .toAny()
    }
  }
}
