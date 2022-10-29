//
//  HapticList.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HapticsListPage: View, Page {
  var title: String = L10n.HapticList.title

  let link: String = """
  https://developer.apple.com/design/human-interface-guidelines/patterns/playing-haptics/
  """

  let hapticLink: String = """
  https://github.com/giovaninppc/AccessibilityHandbook/blob/main/Accessibility%20Handbook/UI/Haptic.swift
  """

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        Text(L10n.HapticList.text1)

        item(title: L10n.Haptics.selection) { haptic(.selection) }
        item(title: L10n.Haptics.success) { haptic(.success) }
        item(title: L10n.Haptics.error) { haptic(.error) }
        item(title: L10n.Haptics.warning) { haptic(.warning) }
        item(title: L10n.Haptics.lighImpact) { haptic(.lightImpact) }
        item(title: L10n.Haptics.mediumImpact) { haptic(.mediumImpact) }
        item(title: L10n.Haptics.heavyImpact) { haptic(.heavyImpact) }

        extra
      }
      .toAny()
    }
  }

  private var extra: some View {
    Group {
      Comment(L10n.HapticList.comment)
      ExternalLink(link: hapticLink, title: L10n.HapticList.sourceCode)
      DocButton(link: link, title: L10n.haptics)
    }
  }

  @ViewBuilder
  private func item(title: String, onAction: @escaping () -> Void) -> some View {
    VStack {
      VStack(alignment: .leading, spacing: .regular) {
        Button {
          onAction()
        } label: {
          Text("• \(title)")
            .font(.body.bold())
        }
        .accessibilityLabel(Text(title))

        Rectangle()
          .frame(height: .single)
          .foregroundColor(.secondaryBackground)
          .accessibilityHidden(true)
      }
    }
  }
}
