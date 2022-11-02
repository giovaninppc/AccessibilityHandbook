//
//  RotorPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct RotorPage: View, Page {
  let title: String = L10n.rotor
  @State private var sheet: Bool = false

  var body: some View {
    PageContent(next: RotorAndHeadersPage(), deeplink: deeplink) {
      Group {
        intro
        example
        content
      }
      .toAny()
    }
    .sheet(isPresented: $sheet, onDismiss: {
      sheet = false
    }, content: {
      RotorExampleView()
    })
  }
}

private extension RotorPage {
  @ViewBuilder
  var intro: some View {
    Comment(L10n.Rotor.comment1)
    Text(L10n.Rotor.text1)
    Comment(L10n.Rotor.comment2)
  }

  @ViewBuilder
  var content: some View {
    Text(L10n.Rotor.text2)
    Text(L10n.Rotor.text3)
    code
    Comment(L10n.Rotor.comment3)
    Button {
      sheet = true
    } label: {
      Text(L10n.Rotor.openExample)
    }

    DocButton(
      link: "https://developer.apple.com/documentation/objectivec/nsobject/1649788-accessibilitycustomrotors",
      title: title
    )
  }

  @ViewBuilder
  var code: some View {
    Code.uikit(
      """
      accessibilityCustomRotors = UIAccessibilityCustomRotor()
      """
    )
    Code.swiftUI(
      """
      @Namespace
      var customRotorNamespace

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
    )
  }

  @ViewBuilder
  var example: some View {
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
