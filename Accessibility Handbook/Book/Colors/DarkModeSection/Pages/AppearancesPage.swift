//
//  AppearancesPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct AppearancesPage: View, Page {
  let title: String = "Appearances"

  var body: some View {
    PageContent(next: DynamicColorsPage()) {
      Group {
        intro
      }
      .toAny()
    }
  }
}

private extension AppearancesPage {
  var intro: some View {
    Group {

    }
  }
}
