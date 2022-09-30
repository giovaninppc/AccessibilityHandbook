//
//  HapticsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HapticsPage: View, Page {
  let title: String = L10n.haptics

  let link: String = """
  https://developer.apple.com/design/human-interface-guidelines/patterns/playing-haptics/
  """

  let hapticLink: String = """
  https://developer.apple.com/design/human-interface-guidelines/patterns/playing-haptics/
  """

  let code: String = """
  // Selection
  UISelectionFeedbackGenerator()
    .selectionChanged()

  // Impact - light, medium , heavy
  UIImpactFeedbackGenerator(style: .light)
    .impactOccurred()

  // Success, error , warning
  UINotificationFeedbackGenerator()
    .notificationOccurred(.success)
  """

  var body: some View {
    PageContent(next: HapticsListPage()) {
      Group {
        Text(L10n.Haptic.text1)
        Text(L10n.Haptic.text2)
        Comment(L10n.Haptic.comment1)
        Text(L10n.Haptic.text3)
        Text(L10n.Haptic.text4)
        Text(L10n.Haptic.text5)
        Code(
          code: code,
          icon: "dot.radiowaves.left.and.right",
          title: L10n.haptics
        )
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }
}
