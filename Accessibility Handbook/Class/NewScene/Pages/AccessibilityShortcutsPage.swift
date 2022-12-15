//
//  AccessibilityShortcuts.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 14/12/22.
//

import SwiftUI

struct AccessibilityShortcutsPage: View, Page {
  let title: String = L10n.AccessibilityShortcuts.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        disclaimer
        intro
        magicTap
        rotor
      }
      .toAny()
    }
  }
}

private extension AccessibilityShortcutsPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.rotor + .commaSpace + L10n.MagicTap.title, destination: IndexView.rotorAndMagicTapDeeplink())
  }

  var intro: some View {
    Comment(L10n.AccessibilityShortcuts.comment1)
  }

  @ViewBuilder
  var magicTap: some View {
    Title(L10n.AccessibilityShortcuts.Magic.title)
    Text(L10n.AccessibilityShortcuts.Magic.text1)
    Text(L10n.AccessibilityShortcuts.Magic.text2)
    Comment(L10n.AccessibilityShortcuts.Magic.comment1)
    Text(L10n.AccessibilityShortcuts.Magic.text3)
    Text(L10n.AccessibilityShortcuts.Magic.text4)
    Text(L10n.AccessibilityShortcuts.Magic.text5)
    Comment(L10n.AccessibilityShortcuts.Magic.comment2)
    Text(L10n.AccessibilityShortcuts.Magic.text6)
    Text(L10n.AccessibilityShortcuts.Magic.text7)
  }

  @ViewBuilder
  var rotor: some View {
    Title(L10n.AccessibilityShortcuts.Rotor.title)
    Text(L10n.AccessibilityShortcuts.Rotor.text1)
    Text(L10n.AccessibilityShortcuts.Rotor.text2)
    Text(L10n.AccessibilityShortcuts.Rotor.text3)
    Comment(L10n.AccessibilityShortcuts.Rotor.comment1)
    Text(L10n.AccessibilityShortcuts.Rotor.text4)
    InternalLink(deeplink: CustomPageDeeplinks.rotorExampleDeeplink(), title: L10n.Rotor.openExample)
  }
}
