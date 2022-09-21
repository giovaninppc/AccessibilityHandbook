//
//  AboutTheAppView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct AboutTheAppView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .regular) {
        history
        VerticalSpace(.regular)
        game
        VerticalSpace(.regular)
        disclaimer
      }
      .padding()
    }
    .navigationTitle("About the app")
  }

  private var history: some View {
    Group {
      Title("History")
      Text("The Accessibility Handbook started as an idea with some colleagues and friends, aiming to be an easy way to learn more about iOS accessibility features.")
      Text("At the time we started working on it, but we never got to finish or publish the Handbook. So, a while later, I took what I learned and decided to bring it into the world! Rewriting the contents, adding UIKit and SwiftUI versions to make something really fresh and nice.")
      Text("I always thought the information about accessibility was always there, but you had to know what to look for.")
      Text("That's where this handbook comes, it's something that can be collaborative, easy to use, and fast to find! It's an app! You can carry it around with you and read anytime.")
      Text("It's mostly based on my experiences as a developer, with real-life examples that (I hope) will help you understand more about Accessibility and also help you use in your own projects!")
    }
  }

  private var game: some View {
    Group {
      Title("What about the Game?")
      Text("The Handbook was pretty nice and all... but it was a little boring.")
      Text("So I tryied to make something that would be nicer to use and to learn,")
      Text("And what best way to do that than with a game?")
      Comment("The puzzles are not supposed to be hard, thay are just a nice way to practice your accessibility knowledge!")
      InternalLink(page: GameView().toAny(), title: "Go play it!")
    }
  }

  private var disclaimer: some View {
    Group {
      Title("Disclaimer")
      Text("This app and it's content is supposed to be a helpful guide, based on real development experiences.")
      Text("I do not know EVERYTHING about accessibility, and I'm learning a little bit more every day.")
      Comment("And I have sure learned a lot while developing this very own app!")
      Text("It may have some mistakes or misconceptions, so please, consider reporting if you find any of those.")
      Text("I want it to be a reliable tool that can be cosulted during everyday development.")
      InternalLink(page: CollaborationView().toAny(), title: "Check the Collaboration page to see more ways to report issues and to help the app's development!")
    }
  }
}
