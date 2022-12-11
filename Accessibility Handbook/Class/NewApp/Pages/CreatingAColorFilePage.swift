//
//  ThinkingAccessibilityPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAColorFilePage: View, Page {
  let title: String = L10n.CreateAColorFile.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {

      }
      .toAny()
    }
  }
}
