//
//  AccessibilityTraitPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityTraitPage: View, Page {
  var title: String = "Accessibility Trait"

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
    PageContent(next: AccessibilityValuePage()) {
      Group {
        Text("Accessibility Traits are modifiers we can add to a view in order to give some additional information or add some behavior to it.")
        Text("There are several traits, some of them you may never have to use, and some other ones are really powerful and you'll be gklad to know more about them.")
        VerticalSpace(.regular)
        Text("Traits are so important we have a dedicated section to them!")
        InternalLink(page: ListOfAccessibilityTraitsPage().page, title: "List of Accessibility Traits")
        Comment("Make sure to check that section to learn more about each trait.")
        Text("And adding a trait to a view is very simple.")
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }
}
