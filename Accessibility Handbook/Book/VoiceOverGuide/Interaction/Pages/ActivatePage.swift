//
//  ActivatePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct ActivatePage: View, Page {
  var title: String = "Activate Element"

  let codeUIKit: String = """
  override func accessibilityActivate() -> Bool {
    /*Handle action*/
    return true
  }
  """

  let codeSwiftUI: String = """
  .accessibilityAction {
    /*HandleAction*/
  }
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615165-accessibilityactivate
  """

  var body: some View {
    PageContent(next: LongPressPage()) {
      Group {
        Text("Activating an element (double tapping it with the Voice-Over enabled) is the same as a single tap when not using the voice over.")
        Comment("Tap a button, click on a cell...")
        Text("Most of the time, this action will hapen automatically when your cell has a tap gesture our is a button.")
        Text("But you can customize or add a specific action for the activation gesture")
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }
}
