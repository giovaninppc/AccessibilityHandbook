//
//  LongPressPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct LongPressPage: View, Page {
  var title: String = L10n.LongPress.title

  let codeUIKit: String = """
  let gesture = UILongPressGestureRecognizer()
  myView.addGestureRecognizer(gesture)
  """

  let codeSwiftUI: String = """
  .onLongPressGesture {
    // \(L10n.LongPress.Code.comment)
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uilongpressgesturerecognizer
  """

  var body: some View {
    PageContent(next: AdjustablePage()) {
      Group {
        Comment(L10n.LongPress.comment1)
        Text(L10n.LongPress.text1)
        Text(L10n.LongPress.text2)
        Text(L10n.LongPress.text3)

        example

        Comment(L10n.LongPress.comment2)
        Text(L10n.LongPress.text4)
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
      HStack {
        Spacer()

        Text(L10n.LongPress.Example.text)
          .font(.body.bold())
          .accessibilityHint(L10n.LongPress.Example.hint)
          .padding()
          .background {
            RoundedRectangle(cornerRadius: 8.0)
              .foregroundColor(.secondaryBackground)
          }
          .onLongPressGesture {
            UIPasteboard.general.string = L10n.LongPress.Example.text
            UIAccessibility.post(notification: .announcement, argument: L10n.LongPress.Example.notification)
          }

        Spacer()
      }
      VerticalSpace(.regular)
    }
  }
}
