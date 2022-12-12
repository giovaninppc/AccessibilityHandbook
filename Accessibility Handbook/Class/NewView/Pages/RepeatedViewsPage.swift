//
//  RepeatedViewsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct RepeatedViewsPage: View, Page {
  let title: String = "RepeatedViews"

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
