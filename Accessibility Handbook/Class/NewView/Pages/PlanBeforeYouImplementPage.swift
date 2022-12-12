//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct PlanBeforeYouImplementPage: View, Page {
  let title: String = "PlanBeforeYouImplement"

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
