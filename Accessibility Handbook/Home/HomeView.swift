//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(alignment: .center, spacing: .large) {
        gameCell
        Title("Development Guides")
        HStack {
          voiceOverGuide
          colorsGuide
        }
        HStack {
          dynamicFontsGuide
          otherGuide
        }
        Title("About the app")
        HStack {
          aboutCell
          collaborationCell
        }
      }
      .padding()
    }
    .navigationTitle(L10n.handbook)
    .onRotate { newOrientation in
      orientation = newOrientation
    }
  }
}

// MARK: - GameCell

private extension HomeView {
  var gameCell: some View {
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
            .frame(width: 100.0, height: 100.0)
          Spacer()
        }
        Text("The Handbook Game")
          .font(.title3.bold())
        Comment("Test your accessibility knowledge in a series of puzzles!")
      }
      .frame(maxWidth: 350.0)
      .accessibilityElement(children: .combine)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }
}

// MARK: - Guide Cells

private extension HomeView {
  private var voiceOverGuide: some View {
    homeElement(
      icon: .init(systemName: "text.book.closed.fill"),
      title: "Voice-Over Guide",
      destination: IndexView(sections: VoiceOverGuideSections()).toAny()
    )
  }

  private var colorsGuide: some View {
    homeElement(
      icon: .init(systemName: "paintpalette.fill"),
      title: "Colors Guide",
      destination: IndexView(sections: ColorsSection()).toAny()
    )
  }

  private var dynamicFontsGuide: some View {
    homeElement(
      icon: .init(systemName: "textformat"),
      title: "Dynamic Fonts",
      destination: IndexView(sections: DynamicFontSections()).toAny()
    )
  }

  private var otherGuide: some View {
    homeElement(
      icon: .init(systemName: "circle.hexagonpath.fill"),
      title: "Other features",
      destination: IndexView(sections: OthersSections()).toAny()
    )
  }
}

// MARK: - About cells

private extension HomeView {
  private var aboutCell: some View {
    homeElement(
      icon: .init(systemName: "questionmark.app.dashed"),
      title: "About the app",
      destination: AboutTheAppView().toAny()
    )
  }

  private var collaborationCell: some View {
    homeElement(
      icon: .init(systemName: "text.redaction"),
      title: "Collaborate",
      destination: CollaborationView().toAny()
    )
  }
}

private extension HomeView {
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
          .frame(width: 50.0, height: 50.0)
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
