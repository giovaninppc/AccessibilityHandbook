//
//  DifferentiateWithoutColorsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct DifferentiateWithoutColorsPage: View, Page {
  var title: String = "Differentiate without colors"

  var body: some View {
    PageContent(next: InvertColorsPage()) {
      Group {
        intro
        handling
      }
      .toAny()
    }
  }
}

private extension DifferentiateWithoutColorsPage {
  var intro: some View {
    Group {
      Text("The Differentiate Without Colors, is the way the user can ask to, well, do not use only colors to differentiate content.")
      Text("On code, it's basically going to be a boolean you can check if the user enabled this feature or not.")
      Comment("Although, most of the time, it is a good practice to not use only colors to differentiate content. This is the kind of issue that can be prevented on the 'design step', while planning your app or your feature, and before implementing it.")
      Text("This feature can be enabled on the device's settings at the Accessibility section.")
      ExternalLink(link: UIApplication.openSettingsURLString, title: "Open settings")
      Text("Here's a classic example, the wire game! Where you need to connect the wires with the same color on both sides of the screen.")
      Text("By adding icons next to the wires, you make sure the game does not rely only on color coding to be played.")
      Asset.coloblindWireGame.swiftUIImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .accessibilityLabel("Image of the Among Us game wire game with multiple color blindness filters applyed.")
      Comment("A nice example is the game 'Among Us'. On the image above, from left-to-right then top-to-bottom: no filter, deuteranopia filter, protanopia filter, tritanopia filter. These weird names are the names of some color blindness types.")
    }
  }

  var handling: some View {
    Group {
      Text("To check if the feature is enabled, you can check 'UIAccessibility.shouldDifferentiateWithoutColor'")
      Code(
        uiKit: """
        if UIAccessibility
            .shouldDifferentiateWithoutColor { ... }
        """
      )
      Text("And you can alo subscribe to listen to changes in this prtoperty using the Notification Center.")
      Code(
        uiKit: """
        NotificationCenter
        .default
        .addObserver(
            forName: UIAccessibility.differentiateWithoutColorDidChangeNotification,
            object: nil,
            queue: nil
        ) { ... }
        """
      )
      Text("And you can use an Environment property in SwiftUI for the same purpose.")
      Code(
        swiftUI: """
        @Environment(\\.accessibilityDifferentiateWithoutColor)
        var differentiateWithoutColor
        """
      )
      DocButton(link: "https://developer.apple.com/documentation/uikit/uiaccessibility/3043554-differentiatewithoutcolordidchan", title: title)
    }
  }
}
