//
//  AccessibilityShortcuts.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 14/12/22.
//

import SwiftUI

struct AccessibilityShortcutsPage: View, Page {
  let title: String = "AccessibilityShortcutsPage"

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
