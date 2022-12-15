//
//  RunTheAppInRealLifePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct RunTheAppInRealLifePage: View, Page {
  let title: String = L10n.RunIRL.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        shortcuts
      }
      .toAny()
    }
  }
}

private extension RunTheAppInRealLifePage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.RunIRL.text1)
    Text(L10n.RunIRL.text2)
    Text(L10n.RunIRL.text3)
    Comment(L10n.RunIRL.comment1)
    Text(L10n.RunIRL.text4)
    Text(L10n.RunIRL.text5)
  }

  @ViewBuilder
  var shortcuts: some View {
    Title(L10n.RunIRL.Shortcuts.title)
    Text(L10n.RunIRL.Shortcuts.text1)
    Text(L10n.RunIRL.Shortcuts.text2)
    Text(L10n.RunIRL.Shortcuts.text3)
    Text(L10n.RunIRL.Shortcuts.text4)
    Centered {
      VStack(alignment: .center, spacing: .regular) {
        Asset.controlCenterAccessibilityShortcuts.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(maxWidth: 250.0)
          .accessibilityHidden(true)
        Comment(L10n.RunIRL.Shortcuts.image)
          .multilineTextAlignment(.center)
      }
      .toAny()
    }
  }
}
