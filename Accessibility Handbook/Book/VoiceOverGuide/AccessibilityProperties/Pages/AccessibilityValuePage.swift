//
//  AccessibilityValuePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityValuePage: View, Page {
  var title: String = L10n.AccValue.title

  let link = """
  https://developer.apple.com/documentation/uikit/uiaccessibilityelement/1619583-accessibilityvalue
  """

  @State private var currentValue: Int = 0

  var body: some View {
    PageContent(next: AccessibilityPriorityPage()) {
      Group {
        Text(L10n.AccValue.text1)
        Text(L10n.AccValue.text2)
        Text(L10n.AccValue.text3)
        Comment(L10n.AccValue.comment1)
        AdjustableCounter(value: $currentValue)
        Comment(L10n.AccValue.comment2)
        InternalLink(page: AdjustablePage().page, title: L10n.Adjustable.title)
        Code.uikit(
          """
          myView.accessibilityValue = "value"
          """
        )
        Code.swiftUI(
          """
          View()
          .accessibilityValue("value")
          """
        )
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }
}
