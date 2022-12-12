//
//  UnderstandHowComponentsInteractPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct UnderstandHowComponentsInteractPage: View, Page {
  let title: String = "UnderstandHowComponentsInteract"

  var body: some View {
    PageContent(next: HiddenObjectsPage(), deeplink: deeplink) {
      Group {
      }
      .toAny()
    }
  }
}
