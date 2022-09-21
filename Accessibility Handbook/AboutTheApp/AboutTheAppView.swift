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
      Text("The Accessibility Handbook started as a personal project, aiming to be an easy way to learn more about iOS accessibility features.")
      Text("I always thought the information about accessibility was always there, but you had to know what to look for.")
      Text("So, I decided to make a guide, something that could be collaborative, easy to use, and fast to find!")
      Text("Its based in my experiences as a developer, with real-life examples that (I hope) will help you understand more about Accessibility and also help you use in your own projects!")
    }
  }

  private var game: some View {
    Group {
      Title("What about the Game?")
      Text("The Handbook was pretty nice and all... but it was a little boring.")
      Text("So I tryied to make something that would be nicer to use and to learn,")
      Text("And what best way to do that than with a game?")
      Comment("The puzzles are not supposed to be hard, thay are just a nice way to practice your accessibility knowledge!")
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
      InternalLink(page: CollaborationView().toAny(), title: "Check the Collaboration page to see more ways to report issuees and to help the development!")
    }
  }
}
