//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct ThinkingAccessibilityPage: View, Page {
  let title: String = L10n.ThinkingAccessibility.title

  var body: some View {
    PageContent(next: TeamGamePage(), deeplink: deeplink) {
      Group {
        Text(L10n.ThinkingAccessibility.text1)
        Text(L10n.ThinkingAccessibility.text2)
        Text(L10n.ThinkingAccessibility.text3)
        Text(L10n.ThinkingAccessibility.text4)
        // Maybe add a nice image in here?
        Text(L10n.ThinkingAccessibility.text5)
        Comment(L10n.ThinkingAccessibility.comment1)
        Text(L10n.ThinkingAccessibility.text6)
        Comment(L10n.ThinkingAccessibility.comment2)
      }
      .toAny()
    }
  }
}
