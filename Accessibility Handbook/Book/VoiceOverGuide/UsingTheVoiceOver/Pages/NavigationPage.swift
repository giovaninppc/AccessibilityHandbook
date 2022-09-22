//
//  Navigation.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct NavigationPage: View, Page {
  var title: String = L10n.Navigation.title

  var body: some View {
    PageContent(next: ElementReadingOrderPage()) {
      Group {
        Text(L10n.Navigation.text1)
        Text(L10n.Navigation.text2)
        Text(L10n.Navigation.text3)
        Text(L10n.Navigation.text4)
        Comment(L10n.Navigation.comment)
      }
      .toAny()
    }
  }
}
