//
//  ActivatePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct ActivatePage: View, Page {
  var title: String = L10n.Activate.title

  let codeUIKit: String = """
  override func accessibilityActivate() -> Bool {
    // \(L10n.Activate.codeComment)
    return true
  }
  """

  let codeSwiftUI: String = """
  .accessibilityAction {
    // \(L10n.Activate.codeComment)
  }
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615165-accessibilityactivate
  """

  var body: some View {
    PageContent(next: LongPressPage(), deeplink: deeplink) {
      Group {
        Text(L10n.Activate.text1)
        Comment(L10n.Activate.comment1)
        Text(L10n.Activate.text2)
        Text(L10n.Activate.text3)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }
}
