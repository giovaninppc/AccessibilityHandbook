//
//  EnableVoiceOverPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 23/09/22.
//

import SwiftUI

struct EnableVoiceOverPage: View, Page {
  let title: String = L10n.EnableVoiceOver.title

  let docLink: String = """
  https://support.apple.com/guide/iphone/use-voiceover-in-apps-iphe4ee74be8/ios
  """

  var body: some View {
    PageContent(next: NavigationPage()) {
      Group {
        Text(L10n.EnableVoiceOver.text1)
        Text(L10n.EnableVoiceOver.text2)
        ExternalLink(link: UIApplication.openSettingsURLString, title: L10n.openSettings)
        Text(L10n.EnableVoiceOver.text3)
        VerticalSpace(.regular)
        Text(L10n.EnableVoiceOver.text4)
        Text(L10n.EnableVoiceOver.text5)
        Text(L10n.EnableVoiceOver.text6)
        Comment(L10n.EnableVoiceOver.comment)
        DocButton(link: docLink, title: L10n.voiceOver)
      }
      .toAny()
    }
  }
}
