//
//  ReadingOrderPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct ElementReadingOrderPage: View, Page {
  let title: String = L10n.ElementReadingOrder.title

  var body: some View {
    PageContent(next: RotorPage(), deeplink: deeplink) {
      Group {
        Text(L10n.ElementReadingOrder.text1)
        Comment(L10n.ElementReadingOrder.comment1)
        Text(L10n.ElementReadingOrder.text2)
        Text(L10n.ElementReadingOrder.text3)
        Comment(L10n.ElementReadingOrder.comment2)
        InternalLink(page: AccessibilityPriorityPage().page, title: L10n.ElementReadingOrder.link)
        Text(L10n.ElementReadingOrder.text4)
        Text(L10n.ElementReadingOrder.text5)
        VerticalSpace(.regular)
        readingOrder
      }
      .toAny()
    }
  }

  private var readingOrder: some View {
    Group {
      Text("Accessibility Label | Accessibility Value | Accessibility Traits (button) | Accessibility Hint ")
        .font(.callout.bold())
        .foregroundColor(.purple)
        .accessibilityLabel("Accessibility Label")
        .accessibilityHint("Accessibility Hint")
        .accessibilityAddTraits(.isButton)
        .accessibilityValue("Accessibility Value")
    }
    .accessibilityElement(children: .combine)
  }
}
