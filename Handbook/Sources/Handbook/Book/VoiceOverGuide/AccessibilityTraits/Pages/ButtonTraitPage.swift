//
//  ButtonTrait.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ButtonTraitPage: View, Page {
  let title: String = L10n.ButtonTrait.title

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
        Text(L10n.ButtonTrait.text1)
        Text(L10n.ButtonTrait.text2)
        Text(L10n.ButtonTrait.text3)
        Text(L10n.ButtonTrait.text4)
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
        Text(L10n.ButtonTrait.myCell)
          .font(.title3.bold())
        Text(L10n.ButtonTrait.cellDescription)
        Comment(L10n.ButtonTrait.additionalInformation)
      }
      .padding()
      .accessibilityAddTraits([.isButton])
      .accessibilityElement(children: .combine)
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
      .onTapGesture {
        UIAccessibility.post(notification: .announcement, argument: L10n.ButtonTrait.cellTapped)
      }
      .accessibilityAction {
        UIAccessibility.post(notification: .announcement, argument: L10n.ButtonTrait.cellTapped)
      }
      Spacer()
    }
  }
}
