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

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("An announcement notification is a way to make the Voice-Over read something that is not currently focused.")
        Text("Sometimes, some information changes on the screen and we show to the user using some animation to grab their attention.")
        Text("But, we cannot rely on visual cues to show information when talking about visual accessibility.")
        Comment("To me, that's where the announcements shine!")
        example
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      VerticalSpace(.regular)
    }
  }
}
