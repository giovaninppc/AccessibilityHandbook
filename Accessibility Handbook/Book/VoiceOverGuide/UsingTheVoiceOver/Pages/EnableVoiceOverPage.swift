//
//  EnableVoiceOverPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 23/09/22.
//

import SwiftUI

struct EnableVoiceOverPage: View, Page {
  var title: String = "Enable Voice-Over"

  let docLink: String = """
  https://support.apple.com/guide/iphone/use-voiceover-in-apps-iphe4ee74be8/ios
  """

  var body: some View {
    PageContent(next: NavigationPage()) {
      Group {
        Text("The Voice-Over is the name of the iOS's native screen reader solution. Used to provide visual impairment accessibility.")
        Text("To enable the Voice-Over, go to the device's settings, on the 'Accessibility section'.")
        ExternalLink(link: UIApplication.openSettingsURLString, title: "Open settings")
        Text("Then, navigate to Voice-Over and turn the toggle on.")
        VerticalSpace(.regular)
        Text("As an alternative to doing this every time you want to enable the Voice-Over, you may navigate to the Accessibility section again, and change the 'Accessibility shortcut' section.")
        Text("There, select the features you want to have quick-access to (make sure to select the Voice-Over)")
        Text("And now, you can access any of those features by triple-pressing the side button on your device (the one that locks the screen).")
        Comment("Beyond providing faster access to turning the Voice-Over on, it also helps to turn it off if you get stuck while using the it.")
        DocButton(link: docLink, title: "Voice-Over")
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
