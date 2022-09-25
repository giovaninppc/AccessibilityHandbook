//
//  AdjustablePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AdjustablePage: View, Page {
  let title: String = L10n.Adjustable.title

  let codeUIKit: String = """
  accessibilityTraits = [.adjustable]

  override func accessibilityIncrement() {
    // \(L10n.Adjustable.Code.increment)
  }
  override func accessibilityDecrement() {
    //\(L10n.Adjustable.Code.decrement)
  }
  """

  let codeSwiftUI: String = """
  View()
  .accessibilityAdjustableAction { direction in
    switch direction {
    case .decrement:
      // \(L10n.Adjustable.Code.decrement)
    case .increment:
      // \(L10n.Adjustable.Code.increment)
    }
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620177-adjustable
  """

  @State private var currentValue: Int = 0

  var body: some View {
    PageContent(next: CustomActionsPage()) {
      Group {
        Text(L10n.Adjustable.text1)
        InternalLink(page: ListOfAccessibilityTraitsPage().page, title: L10n.Adjustable.seeMore)
        Text(L10n.Adjustable.text1)
        Text(L10n.Adjustable.text2)
        Text(L10n.Adjustable.text3)
        example
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      AdjustableCounter(value: $currentValue)
      VerticalSpace(.regular)
    }
  }
}
