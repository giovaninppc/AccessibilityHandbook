//
//  TeamGamePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct TeamGamePage: View, Page {
  let title: String = L10n.TeamGame.title

  var body: some View {
    PageContent(next: LearnTheFeaturesPage(), deeplink: deeplink) {
      Group {
        intro
        talkToYourTeam
        shareTheKnowledge
      }
      .toAny()
    }
  }
}

private extension TeamGamePage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.TeamGame.text1)
    Comment(L10n.TeamGame.comment1)
    Text(L10n.TeamGame.text2)
    Text(L10n.TeamGame.text3)
    Text(L10n.TeamGame.text4)
    Text(L10n.TeamGame.text5)
    CenterSafesizedImage(
      image: Asset.classWelcomeCode.swiftUIImage,
      description: L10n.TeamGame.ShareTheKnowledge.image
    )
  }

  @ViewBuilder
  var talkToYourTeam: some View {
    Title(L10n.TeamGame.TalkToYourTeam.title)
    Text(L10n.TeamGame.TalkToYourTeam.text1)
    Text(L10n.TeamGame.TalkToYourTeam.text2)
    Comment(L10n.TeamGame.TalkToYourTeam.comment1)
    Text(L10n.TeamGame.TalkToYourTeam.text3)
    Text(L10n.TeamGame.TalkToYourTeam.text4)
    Text(L10n.TeamGame.TalkToYourTeam.text5)
    Text(L10n.TeamGame.TalkToYourTeam.text6)
    Comment(L10n.TeamGame.TalkToYourTeam.comment2)
    Text(L10n.TeamGame.TalkToYourTeam.text7)
  }

  @ViewBuilder
  var shareTheKnowledge: some View {
    Title(L10n.TeamGame.ShareTheKnowledge.title)
    Text(L10n.TeamGame.ShareTheKnowledge.text1)
    Text(L10n.TeamGame.ShareTheKnowledge.text2)
    Comment(L10n.TeamGame.ShareTheKnowledge.comment1)
    Text(L10n.TeamGame.ShareTheKnowledge.text3)
  }
}
