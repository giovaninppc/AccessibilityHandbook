//
//  ReadingOrderPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct ElementReadingOrderPage: View, Page {
  static let strings = L10n.ElementReadingOrder.self

  var title: String = strings.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("The Voice-Over will read the content on the screen trying to follow the 'Natural reading direction of the Language'")
        Comment("What does it mean?")
        Text("For instance, English, the natural reading directions is left-to-right then up-to-down")
        Text("So the Voice Over will follow this same order when reading the content.")
        Comment("You can change the reading order of your elements... if you want...")
        InternalLink(page: AccessibilityPriorityPage().page, title: "Check the 'Accessibility Priority' page for more informations")
        Text("But when we are talking about a single focused element (the element the cursor is currently at)")
        Text("The content will be read in the following order:")
        VerticalSpace(.regular)
        readingOrder
      }
      .toAny()
    }
  }

  // <Accessibility-Label><Accessibility-Hint><Accessibility-traits><Accessibility-Value>
  private var readingOrder: some View {
    Group {
      Text("Accessibility Label")
        .font(.callout.bold())
        .foregroundColor(.purple)
      Text("Accessibility Hint")
        .font(.callout.bold())
        .foregroundColor(.mint)
      Text("Accessibility Traits")
        .font(.callout.bold())
        .foregroundColor(.orange)
      Text("Accessibility Value")
        .font(.callout.bold())
        .foregroundColor(.cyan)
    }
    .accessibilityElement(children: .combine)
  }
}
