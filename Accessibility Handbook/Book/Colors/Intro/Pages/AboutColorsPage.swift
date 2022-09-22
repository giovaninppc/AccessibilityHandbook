//
//  AboutColors.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AboutColorsPage: View, Page {
  var title: String = "About Colors"

  var body: some View {
    PageContent(next: ColorBlindnessPage()) {
      Group {
        Text("I like colors.\nBut not everybody experience them in the same way.")
        Comment("Some people don't experience them at all!")
        Asset.prettyColors.swiftUIImage
          .resizable()
          .aspectRatio(contentMode: .fit)
          .accessibilityLabel("Image of pretty colors")
        Text("Colors are how our brains make sense of the light that reach our eyes. We have cells that will interact with different frequencies of light, and their combination will produce what we see.")
        Comment("I'm over extending myself into physics and biology, but bear with me.")
        Text("And when building an app, colors are usually something that come before actually programming anything, or during what I like to call 'The design step'.")
        Text("So, if you are working on a team with a Designer, I highly recommend you bring these discussion to them. Understanding more about colors, how they affect the users and what we can consider accessibility while handling colors on our app.")
        Comment("If you don't have a designer there... Well, I hope this content also helps you understand a little bit more about it!")
        DocButton(link: "https://developer.apple.com/design/human-interface-guidelines/foundations/color/", title: "Human Interface Guidelines - Colors")
      }
      .toAny()
    }
  }
}
