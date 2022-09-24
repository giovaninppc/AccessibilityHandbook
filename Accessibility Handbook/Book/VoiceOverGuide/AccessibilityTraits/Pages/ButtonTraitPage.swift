//
//  ButtonTrait.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ButtonTraitPage: View, Page {
  var title: String = "Button Trait"

  let codeUIKit: String = """
  myView.accessibilityTraits = [.button]
  """

  let codeSwiftUI: String = """
  .accessibilityAddTraits([.isButton])
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620194-button
  """

  var body: some View {
    PageContent(next: HeaderTraitPage()) {
      Group {
        Text("The button trait is, to me, THE most important trait.")
        Text("It basically tells the user that they can activate the element (with a double tap) and that something will happen")
        Text("If you are using a Button or a UIButton it will automatically have the 'button' trait")
        Text("But sometimes we need to add it manually to our view, like when making a cell that can be tapped, or some other content with a tap gesture.")
        VerticalSpace(.regular)
        example
        VerticalSpace(.regular)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    HStack {
      Spacer()
      VStack(spacing: .regular) {
        Text("My cell")
          .font(.title3.bold())
        Text("Cell description")
        Comment("Additional information")
      }
      .padding()
      .accessibilityAddTraits([.isButton])
      .accessibilityElement(children: .combine)
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
      .onTapGesture {
        UIAccessibility.post(notification: .announcement, argument: "The cell was tapped!")
      }
      .accessibilityAction {
        UIAccessibility.post(notification: .announcement, argument: "The cell was tapped!")
      }
      Spacer()
    }
  }
}
