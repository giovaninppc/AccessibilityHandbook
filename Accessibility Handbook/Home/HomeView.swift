//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .large) {
        game
        Title("Development Guides")
        HStack {
          homeElement(
            icon: .init(systemName: "text.book.closed.fill"),
            title: "Voice-Over Guide",
            destination: IndexView(sections: VoiceOverGuideSections()).toAny()
          )
          homeElement(
            icon: .init(systemName: "circle"),
            title: "Colors Guide",
            destination: IndexView(sections: ColorsSection()).toAny()
          )
        }
        HStack {
          homeElement(
            icon: .init(systemName: "textformat"),
            title: "Dynamic Fonts",
            destination: IndexView(sections: DynamicFontSections()).toAny()
          )
          homeElement(
            icon: .init(systemName: "swift"),
            title: "Other features",
            destination: IndexView(sections: OthersSections()).toAny()
          )
        }
        Title("About the app")
        HStack {
          homeElement(
            icon: .init(systemName: "questionmark.app.dashed"),
            title: "About the app",
            destination: AboutTheAppView().toAny()
          )
          homeElement(
            icon: .init(systemName: "text.redaction"),
            title: "Collaborate",
            destination: CollaborationView().toAny()
          )
        }
      }
      .padding()
    }
    .navigationTitle(L10n.handbook)
  }

  var game: some View {
    NavigationLink {
      GameView()
    } label: {
      VStack(spacing: .regular) {
        Spacer()
        HStack {
          Spacer()
          Image(systemName: "gamecontroller.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80.0, height: 80.0)
          Spacer()
        }
        Text("The Handbook Game")
          .font(.title3.bold())
        Comment("Test your accessibility knowledge in a series of puzzles!")
      }
      .accessibilityElement(children: .combine)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }

  @ViewBuilder
  private func homeElement(icon: Image, title: String, destination: AnyView) -> some View {
    NavigationLink {
      destination
    } label: {
      VStack {
        Spacer()
        icon
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 30.0, height: 30.0)
        Spacer()
        Text(title)
          .font(.title3.bold())
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .frame(minWidth: 150.0, minHeight: 150.0)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
