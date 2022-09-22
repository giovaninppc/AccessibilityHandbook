//
//  AnnouncementPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct NotifyScreenChangesPage: View, Page {
  var title: String = "Announcement"

  let codeUIKit: String = """
  UIAccessibility.post(.layoutChanged, argument: nil)
  UIAccessibility.post(.screenChanged, argument: nil)
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibility/notification/1620176-announcement
  """

  var body: some View {
    PageContent(next: ChangeCursorPositionPage()) {
      Group {
        Text("When something changes on the screen, we need to remember a Voice-Over user will not be able to see it.")
        Text("This is also valid to when the screen itself changes.")
        Text("But, we have some Accessibility Notifications that behave like audio cues to tell the user something has happened.")
        VerticalSpace(.regular)
        Button {
          UIAccessibility.post(notification: .screenChanged, argument: nil)
        } label: {
          Text("Screen changed notification")
            .font(.callout.bold())
        }

        Button {
          UIAccessibility.post(notification: .layoutChanged, argument: nil)
        } label: {
          Text("Layout changed notification")
            .font(.callout.bold())
        }

        Code(uiKit: codeUIKit)

        Comment("But what is the argument that is 'nil' on the code?")
        Comment("Find out more about it on the following page!")

        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }
}
