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
    }
  }
}
