//
//  PrefferCrossFadePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 03/10/22.
//

import SwiftUI

struct PreferCrossFadePage: View, Page {
  let title: String = L10n.PreferCrossFadePage.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text(L10n.PreferCrossFadePage.text1)
        InternalLink(page: ReduceMotionPage().page, title: L10n.ReduceMotion.title)
        Text(L10n.PreferCrossFadePage.text2)
        Text(L10n.PreferCrossFadePage.text3)
        Comment(L10n.PreferCrossFadePage.comment1)
        Text(L10n.PreferCrossFadePage.text4)
        Code.uikit(
          """
          UIAccessibility.prefersCrossFadeTransitions
          """
        )
        Comment(L10n.PreferCrossFadePage.comment2)
        DocButton(link: "https://developer.apple.com/documentation/uikit/uiaccessibility/3584818-preferscrossfadetransitions", title: title)
      }
      .toAny()
    }
  }
}
