//
//  CreateAFontFile.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct CreatingAFontFilePage: View, Page {
  let title: String = L10n.CreateAFontFile.title

  var body: some View {
    PageContent(next: CreatingAccessibilityModifiersPage(), deeplink: deeplink) {
      Group {

      }
      .toAny()
    }
  }
}
