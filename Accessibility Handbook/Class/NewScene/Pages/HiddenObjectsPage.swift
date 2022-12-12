//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HiddenObjectsPage: View, Page {
  let title: String = "HiddenObjects"

  var body: some View {
    PageContent(next: FigureDifferentFontScalesPage(), deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
