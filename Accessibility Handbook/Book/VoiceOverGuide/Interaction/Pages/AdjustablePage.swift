//
//  AdjustablePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct AdjustablePage: View, Page {
  var title: String = "Adjustable content"

  let codeUIKit: String = """
  accessibilityTraits = [.adjustable]

  override func accessibilityIncrement() { ... }
  override func accessibilityDecrement() { ... }
  """

  let codeSwiftUI: String = """
  .accessibilityAdjustableAction { direction in
      switch direction {
      case .decrement:
          currentValue -= 1
      case .increment:
          currentValue += 1
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
        Text("Adjustable components are actually using an accessibility trait.")
        InternalLink(page: ListOfAccessibilityTraitsPage().page, title: "See more on accessibility traits!")
        Text("It's used on components that have some kind of quantity change or selection, like sliders, counters or quick-adds.")
        Text("It's very powerful, and, when focused, an adjustable view will gain the swipe up and down gestures")
        Text("That can be implemented to handle it's respective actions, without the need to directly tap into the buttons.")
        example
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      HStack {
        Spacer()
        Button {
          currentValue -= 1
        } label: {
          Image(systemName: "minus.circle.fill")
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .accessibilityHidden(true)

        HorizontalSpace(.regular)

        Text("\(currentValue)")
          .font(.title.bold())

        HorizontalSpace(.regular)

        Button {
          currentValue += 1
        } label: {
          Image(systemName: "plus.circle.fill")
            .resizable()
            .frame(width: 30.0, height: 30.0)
        }
        .accessibilityHidden(true)
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .accessibilityValue("\(currentValue)")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .decrement:
          currentValue -= 1
        case .increment:
          currentValue += 1
        @unknown default:
          break
        }
      }

      VerticalSpace(.regular)
    }
  }
}
