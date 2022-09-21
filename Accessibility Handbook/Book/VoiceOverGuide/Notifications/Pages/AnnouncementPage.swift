//
//  AnnouncementPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AnnouncementPage: View, Page {
  var title: String = "Announcement"

  let codeUIKit: String = """
  UIAccessibility.post(.announcement, argument: "Text to be read")
  """

  let codeSwiftUI: String = """
  UIAccessibility.post(.announcement, argument: "Text to be read")
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibility/notification/1620176-announcement
  """

  @State private var currentValue: Int = 0

  private var secretDescriptions: String {
    switch currentValue {
    case let value where value < 0:
      return "Going negative, aren't we?"
    case 0:
      return ""
    case 1...5:
      return "Oh the values are increasing!"
    case 6...10:
      return "You like to increase, don't you?"
    case 11...20:
      return "Yep, keep increasing..."
    default:
      return "This is the final message"
    }
  }

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("An announcement notification is a way to make the Voice-Over read something that is not currently focused.")
        Text("Sometimes, some information changes on the screen and we show to the user using some animation to grab their attention.")
        Text("But, we cannot rely on visual cues to show information when talking about visual accessibility.")
        Comment("To me, that's where the announcements shine!")
        example
        Comment("The code cells bellow are another example of announcements when you copy the code!")
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
    .onChange(of: secretDescriptions) { newValue in
      UIAccessibility.post(notification: .announcement, argument: newValue)
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      HStack {
        Spacer()
        Button {
          currentValue -= 1
        } label: {
          Image(systemName: "minus.circle.fill")
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .accessibilityHidden(true)

        HorizontalSpace(.regular)

        Text("\(currentValue)")
          .font(.title.bold())

        HorizontalSpace(.regular)

        Button {
          currentValue += 1
        } label: {
          Image(systemName: "plus.circle.fill")
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .accessibilityHidden(true)
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .accessibilityValue("\(currentValue)")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .decrement:
          currentValue -= 1
        case .increment:
          currentValue += 1
        }
      }

      VerticalSpace(.regular)
      Text(secretDescriptions)
        .font(.callout.bold())
      VerticalSpace(.regular)
    }
  }
}
