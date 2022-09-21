//
//  HapticList.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HapticsListPage: View, Page {
  var title: String = "List of Haptics"

  let link: String = """
  https://developer.apple.com/design/human-interface-guidelines/patterns/playing-haptics/
  """

  let hapticLink: String = """
  https://developer.apple.com/design/human-interface-guidelines/patterns/playing-haptics/
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("Here's a list of the Haptics available:")

        item(title: "Selection") { haptic(.selection) }
        item(title: "Success") { haptic(.success) }
        item(title: "Error") { haptic(.error) }
        item(title: "Warning") { haptic(.warning) }
        item(title: "light Impact") { haptic(.lightImpact) }
        item(title: "Medium Impact") { haptic(.mediumImpact) }
        item(title: "Heavy Impact") { haptic(.heavyImpact) }

        extra
      }
      .toAny()
    }
  }

  private var extra: some View {
    Group {
      Comment("I also suggest you check the source code of this project. It has a nive Haptic wrapper to be used on UIKit or SwiftUI!")
      ExternalLink(link: hapticLink, title: "Haptic Source code")
      DocButton(link: link, title: "Haptics")
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
