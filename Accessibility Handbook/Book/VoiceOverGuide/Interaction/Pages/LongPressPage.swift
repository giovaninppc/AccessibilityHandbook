//
//  LongPressPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct LongPressPage: View, Page {
  var title: String = "Long Press"

  let codeUIKit: String = """
  let gesture = UILongPressGestureRecognizer()
  myView.addGestureRecognizer(
    gesture
  )
  """

  let codeSwiftUI: String = """
  .onLongPressGesture {
    /* Handle Gesture */
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uilongpressgesturerecognizer
  """

  var body: some View {
    PageContent(next: AdjustablePage()) {
      Group {
        Comment("Long press?")
        Text("Long press is not an accessibility specific gesture, but I like to add it here because it has a specific gesture to be handled when using the Voice-Over.")
        Text("To simulate a Long Press you do a triple tap when focused on the item.")
        Text("Turn the Voice-Over on and focus on the next element. It has a long press gesture.")

        example

        Comment("If you are using a long press gesture, I suggest always adding an accessibility hint to tell your user about it!")
        Text("The long press is specially useful on 'Back buttons', which on newer iOS will display the navigation hierarchy, allowing you to easily navigate back to the page you want.")
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

        Text("Some generic view in here")
          .font(.body.bold())
          .accessibilityHint("Tap three times to copy the text")
          .padding()
          .background {
            RoundedRectangle(cornerRadius: 8.0)
              .foregroundColor(.secondaryBackground)
          }
          .onLongPressGesture {
            UIPasteboard.general.string = "Some generic view in here"
            UIAccessibility.post(notification: .announcement, argument: "Text copied to the clipboard")
          }

        Spacer()
      }
      VerticalSpace(.regular)
    }
  }
}
