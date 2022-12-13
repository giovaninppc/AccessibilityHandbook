//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct IsItAModalPage: View, Page {
  let title: String = "Is this a modal view?"

  var body: some View {
    PageContent(next: HandleAnimationsPage(), deeplink: deeplink) {
      Group {
        disclaimer
      }
      .toAny()
    }
  }
}

private extension IsItAModalPage {
  @ViewBuilder
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.Modal.title, destination: ModalViewPage().deeplink)
  }
}
