//
//  HeaderTraitPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HeaderTraitPage: View, Page {
  let title: String = L10n.HeaderTrait.title

  let codeUIKit: String = """
  myView.accessibilityTraits = [.header]
  """

  let codeSwiftUI: String = """
  .accessibilityAddTraits([.isHeader])
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620170-header
  """

  var body: some View {
    PageContent(next: ImageTraitPage()) {
      Group {
        Text(L10n.HeaderTrait.text1)
        Comment(L10n.HeaderTrait.comment1)
        Text(L10n.HeaderTrait.text2)
        InternalLink(page: RotorAndHeadersPage().page, title: L10n.HeaderTrait.link)
        Text(L10n.HeaderTrait.text3)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }
}
