//
//  RotorPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct RotorPage: View, Page {
  var title: String = "Rotor"

  let codeUIKit: String = """
  accessibilityCustomRotors = UIAccessibilityCustomRotor()
  """

  let codeSwiftUI: String = """
  .accessibilityRotorEntry()

  .accessibilityRotor("<Rotor item name>") {
      AccessibilityRotorEntry()
  }
  """

  let docLink: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1649788-accessibilitycustomrotors
  """

  var body: some View {
    PageContent(next: RotorAndHeadersPage()) {
      Group {
        Comment("The Rotor is one of those things I think not everybody knows about.")
        Text("If you do the gesture of a circle with 2 fingers on the screen, you will enable the rotor.")
        Comment("Turn the Voice-Over on and try it for yourself!")
        example
        Text("The rotor has some default actions to it like changing the speaking rate or the Voice-Over's language.")
        Text("You can also create custom actions to the rotor. The idea is to use it to help users find specific content, like filtering for links, or any other similar elements.")
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        Comment("I need to say that I have personally never used a custom rotor action, but it is a powerful tool to have on your accessibility arsenal!")
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
          .accessibilityLabel(Text("Rotor example image"))
        Spacer()
      }
      VerticalSpace(.regular)
    }
  }
}
