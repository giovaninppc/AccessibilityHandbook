//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct NavigationAndDismissPage: View, Page {
  let title: String = "NavigationAndDismissPage"

  var body: some View {
    PageContent(next: AccessibilityShortcutsPage(), deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
