//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct FigureDifferentFontScalesPage: View, Page {
  let title: String = "FigureDifferentFontScales"

  var body: some View {
    PageContent(next: IsItAModalPage(), deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
