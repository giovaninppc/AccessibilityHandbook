//
//  AccessibilityValuePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AccessibilityValuePage: View, Page {
  var title: String = "Accessibility Value"

  let link = """
  https://developer.apple.com/documentation/uikit/uiaccessibilityelement/1619583-accessibilityvalue
  """

  @State private var currentValue: Int = 0

  var body: some View {
    PageContent(next: AccessibilityPriorityPage()) {
      Group {
        Text("Accessibility Values represent the value (most of the times numeric) associated with your view.")
        Text("It's mostly used in components that represents quantities, like counters, sliders or quick-adds.")
        Text("And when changed, if the view is focused, the new value will be announced to the user.")
        Comment("Check the counter example below, change its quantity and notice the 'Accessibility Value' being read.")
        AdjustableCounter(value: $currentValue)
        Comment("This example was built using the 'Adjustable Trait'.")
        InternalLink(page: AdjustablePage().page, title: "Adjustable Trait")
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
