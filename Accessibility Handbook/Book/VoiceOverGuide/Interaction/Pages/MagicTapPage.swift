//
//  MagicTap.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct MagicTapPage: View, Page {
  let title: String = L10n.MagicTap.title

  @State var magicColor: Color = .white

  let colors: [Color] = [
    .red, .green, .blue, .purple, .orange
  ]

  let codeUIKit: String = """
  override func accessibilityPerformMagicTap() -> Bool {
    // \(L10n.handleAction)
    return true
  }
  """

  let codeSwiftUI: String = """
  .accessibilityAction(.magicTap) {
    // \(L10n.handleAction)
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615137-accessibilityperformmagictap
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text(L10n.MagicTap.text1)
        Text(L10n.MagicTap.text2)
        Text(L10n.MagicTap.text3)
        Text(L10n.MagicTap.text4)
        example
        Comment(L10n.MagicTap.comment1)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      Centered {
        Text(L10n.MagicTap.Example.thisContentIsMagic)
          .font(.body.bold())
          .foregroundColor(magicColor)
          .padding()
          .background {
            RoundedRectangle(cornerRadius: 8.0)
              .foregroundColor(.secondaryBackground)
          }
          .accessibilityAction(.magicTap) {
            UIAccessibility.post(notification: .announcement, argument: L10n.MagicTap.Example.magicPerformed)
            magicColor = colors.randomElement() ?? .white
          }
          .toAny()
      }
      VerticalSpace(.regular)
    }
  }
}
