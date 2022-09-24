//
//  MagicTap.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct MagicTapPage: View, Page {
  var title: String = "Magic Tap"

  @State var magicColor: Color = .white

  let colors: [Color] = [
    .red, .green, .blue, .purple, .orange
  ]

  let codeUIKit: String = """
  override func accessibilityPerformMagicTap() -> Bool {
    /* Handle action */
    return true
  }
  """

  let codeSwiftUI: String = """
  .accessibilityAction(.magicTap) {
    /* Handle action */
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615137-accessibilityperformmagictap
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("'Magic Tap' is a double tap with two fingers gesture.")
        Text("You can configure the 'Magic Tap' to do basically anything.")
        Text("Apple's documentation suggests you use it to be a shortcut to 'your main action', such as a music player, it would be suited to play and pause actions, or on a camera app, it would be suited to take a photo.")
        Text("Test the Magic tap on the view below!")
        example
        Comment("When implementing the 'Magic Tap', make sure it's enabled on the focused view, otherwise, it competes with the devices media player, because it's the same gesture to play/pause on the device.")
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      Centered {
        Text("This content has a Magic Tap!")
          .font(.body.bold())
          .foregroundColor(magicColor)
          .padding()
          .background {
            RoundedRectangle(cornerRadius: 8.0)
              .foregroundColor(.secondaryBackground)
          }
          .accessibilityAction(.magicTap) {
            UIAccessibility.post(notification: .announcement, argument: "Magic tap performed")
            magicColor = colors.randomElement() ?? .white
          }
          .toAny()
      }
      VerticalSpace(.regular)
    }
  }
}
