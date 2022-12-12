//
//  UnderstandHowComponentsInteractPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct AccessibilityInspectorPage: View, Page {
  let title: String = "AccessibilityInspectorPage"

  var body: some View {
    PageContent(next: RunTheAppInRealLifePage(), deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
