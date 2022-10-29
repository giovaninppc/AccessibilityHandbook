//
//  RotorPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct RotorPage: View, Page {
  let title: String = L10n.rotor

  let codeUIKit: String = """
  accessibilityCustomRotors = UIAccessibilityCustomRotor()
  """

  let codeSwiftUI: String = """
  @Namespace private var customRotorNamespace

  var body: some View {
      Stack {
        View()
          .accessibilityRotorEntry(
            id: id,
            in: customRotorNamespace
          )
      }
      .accessibilityRotor("Rotor item name") {
        AccessibilityRotorEntry(
          "message",
          id: id,
          in: customRotorNamespace
        )
      }
  }
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1649788-accessibilitycustomrotors
  """

  var body: some View {
    PageContent(next: RotorAndHeadersPage(), deeplink: deeplink) {
      Group {
        Comment(L10n.Rotor.comment1)
        Text(L10n.Rotor.text1)
        Comment(L10n.Rotor.comment2)
        example
        Text(L10n.Rotor.text2)
        Text(L10n.Rotor.text3)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        Comment(L10n.Rotor.comment3)
        DocButton(link: docLink, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      HStack {
        Spacer()
        Image(uiImage: Asset.rotor.image)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 100.0, height: 100.0)
          .accessibilityAddTraits([.isImage])
          .accessibilityLabel(L10n.Rotor.image)
        Spacer()
      }
      VerticalSpace(.regular)
    }
  }
}
