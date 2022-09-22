//
//  InverColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct InvertColorsPage: View, Page {
  var title: String = "Invert colors"

  var body: some View {
    PageContent(next: IncreaseContrastPage()) {
      Group {
        intro
        whatToDo
      }
      .toAny()
    }
  }
}

private extension InvertColorsPage {
  var intro: some View {
    Group {
      Text("Color Inversion is another accessibility option a user can enable on the device's settings.")
      ExternalLink(link: UIApplication.openSettingsURLString, title: "Open settings")
      Text("There are 2 types of color inversion:")
      Text("Classic - where everything will be inverted;")
      Text("Smart - where (almost) everything in light mode will be inverted, and you (the developer) can choose not to.")
      Comment("But why would anyone use this?")
      Text("I believe it comes down to difficulties in reading dark text on top of a white background. I myself, when I'm not using glasses, I find it pretty difficult to read content like this, so I preffer the dark mode, with white text on top of a dark background.")
      Text("The color inversion comes as an alternative to help you in this scenario.")
      VerticalSpace(.regular)
    }
  }

  var whatToDo: some View {
    Group {
      Title("What to do as a developer?")
      Text("You basically need to mark what you don't want to be inverted. Like, images, a photo of your dog, a nice hamburguer that would look gross when inverted...")
      Text("And to do so, you simply need to set a boolean telling you dont want this view to be inverted.")
      Code(
        uiKit: """
        myView.accessibilityIgnoresInvertColors = true
        """,
        swiftUI:  """
        .accessibilityIgnoresInvertColors()
        """
      )
    }
  }
}
