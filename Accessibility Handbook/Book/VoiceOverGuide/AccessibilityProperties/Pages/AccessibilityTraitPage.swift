//
//  AccessibilityTraitPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityTraitPage: View, Page {
  var title: String = "Accessibility Trait"

  var body: some View {
    PageContent(next: AccessibilityValuePage()) {
      Group {

      }
      .toAny()
    }
  }
}
