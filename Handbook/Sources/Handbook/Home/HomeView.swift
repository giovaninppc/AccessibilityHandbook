//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

public struct HomeView: View {
  @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
  @State var text: String = ""

  public init() {}

  public var body: some View {
    ScrollView(showsIndicators: false) {
      if text.isEmpty {
        homeContent
      } else {
        searchView
      }
    }
    .searchable(text: $text, placement: .navigationBarDrawer)
    .navigationTitle(L10n.handbook)
    .onRotate { newOrientation in
      orientation = newOrientation
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
    }
    .padding()
  }
}

// MARK: - Search

private extension HomeView {
  var allPages: [Page] {
    let guideSections = VoiceOverGuideSections().sections + ColorsSection().sections
      + OthersSections().sections + DynamicFontSections().sections
    let guidePages = guideSections.map { $0.pages }.flatMap { $0 }
    let gamePages = Games.pages
    let aboutPages: [Page] = [AboutTheAppView(), CollaborationView()]
    return guidePages + gamePages + aboutPages
  }

  var filteredContent: [Page] {
    allPages.filter { $0.title.lowercased().contains(text.lowercased()) }
  }

  var searchView: some View {
    VStack(alignment: .leading, spacing: .regular) {
      ForEach(filteredContent, id: \.id) { page in
        NavigationLink {
          page.page
        } label: {
          let icon: Image? = {
            switch page {
            case is GamePage:
              return Icon.gameController
            default:
              return nil
            }
          }()
          IndexCell(title: page.title, icon: icon)
        }
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
      icon: Icon.questionMarkDsahed,
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
