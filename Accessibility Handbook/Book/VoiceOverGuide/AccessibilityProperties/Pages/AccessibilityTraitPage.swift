//
//  AccessibilityTraitPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityTraitPage: View, Page {
  let title: String = L10n.AccTrait.title

  let codeUIKit: String = """
  myView.accessibilityTraits = [<.anyTrait>]
  """

  let codeSwiftUI: String = """
  .accessibilityAddTraits(<.anyTrait>)
  """

  let docLink: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitytraits
  """

  var body: some View {
    PageContent(next: AccessibilityValuePage(), deeplink: deeplink) {
      Group {
        Text(L10n.AccTrait.text1)
        Text(L10n.AccTrait.text2)
        VerticalSpace(.regular)
        Text(L10n.AccTrait.text3)
        InternalLink(page: ListOfAccessibilityTraitsPage().page, title: L10n.ListOfTraits.title)
        Comment(L10n.AccTrait.comment1)
        Text(L10n.AccTrait.text4)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }
}
