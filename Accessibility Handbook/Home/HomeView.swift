//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
  @State private var isIpad = UITraitCollection.current.userInterfaceIdiom == .pad
  @State private var text: String = ""
  @State private var searching: Bool = false

  var body: some View {
    ScrollView(showsIndicators: false) {
      if text.isEmpty {
        homeContent
      } else {
        SearchView(text: $text)
      }
    }
    .searchable(text: $text, placement: .navigationBarDrawer(displayMode: searching ? .always : .automatic))
    .navigationTitle(L10n.handbook)
    .onRotate { newOrientation in
      orientation = newOrientation
    }
    .toolbar {
      Button {
        searching.toggle()
      } label: {
        Icon.search
      }
    }
  }
}

// MARK: - Content

private extension HomeView {
  var homeContent: some View {
    VStack(alignment: .center, spacing: .large) {
      gameCell
      Title(L10n.Home.developmentGuides)
      HStack {
        voiceOverGuide
        colorsGuide
      }
      HStack {
        dynamicFontsGuide
        otherGuide
      }
      Title(L10n.AboutTheApp.title)
      HStack {
        aboutCell
        collaborationCell
      }
      whatsNewCell
    }
    .padding()
  }

  var whatsNewCell: some View {
    NavigationLink {
      WhatsNewView().page
    } label: {
      HStack(spacing: .regular) {
        Icon.bookmark
          .aspectRatio(contentMode: .fit)
        Text(L10n.WhatsNew.title)
          .font(.title3.bold())
        Spacer()
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
          Icon.gameController
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100.0, height: 100.0)
          Spacer()
        }
        Text(L10n.Home.handbookGame)
          .font(.title3.bold())
        Comment(L10n.Home.handbookGameDescription)
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
      icon: Icon.book,
      title: L10n.voiceOverGuide,
      destination: IndexView(sections: VoiceOverGuideSections())
        .toolbar {
          NavigationLink {
            GesturesPage()
          } label: {
            Icon.raisedHands
          }
          .accessibilityLabel(L10n.Gestures.title)
        }
        .toAny()
    )
  }

  private var colorsGuide: some View {
    homeElement(
      icon: Icon.paintpalete,
      title: L10n.ColorsGuide.title,
      destination: IndexView(sections: ColorsSection()).toAny()
    )
  }

  private var dynamicFontsGuide: some View {
    homeElement(
      icon: Icon.textformat,
      title: L10n.Home.dynamicFonts,
      destination: IndexView(sections: DynamicFontSections()).toAny()
    )
  }

  private var otherGuide: some View {
    homeElement(
      icon: Icon.circleHexagonpath,
      title: L10n.Home.otherFeatures,
      destination: IndexView(sections: OthersSections()).toAny()
    )
  }
}

// MARK: - About cells

private extension HomeView {
  private var aboutCell: some View {
    homeElement(
      icon: Icon.questionMarkDashed,
      title: L10n.AboutTheApp.title,
      destination: AboutTheAppView().toAny()
    )
  }

  private var collaborationCell: some View {
    homeElement(
      icon: Icon.textRedaction,
      title: L10n.Home.collaborate,
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
      .frame(minWidth: isIpad ? 150.0 : nil,
             maxWidth: isIpad ? nil : UIScreen.main.bounds.width / 2,
             minHeight: 150.0)
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
