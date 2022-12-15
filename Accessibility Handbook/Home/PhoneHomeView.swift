//
//  PhoneHomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/11/22.
//

import SwiftUI

struct PhoneHomeView: View {
  @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
  @State var isOnScreen: Bool = true

  var body: some View {
    homeContent
      .onAppear {
        isOnScreen = true
        orientation = UIDevice.current.orientation
      }
      .onDisappear {
        isOnScreen = false
      }
    .onRotate { newOrientation in
      guard isOnScreen else { return }
      orientation = newOrientation
    }
  }
}

// MARK: - Content

private extension PhoneHomeView {
  @ViewBuilder
  var homeContent: some View {
    if orientation.isLandscape {
      landscapeHomeContent
    } else {
      portraitHomeContent
    }
  }

  var portraitHomeContent: some View {
    VStack(alignment: .center, spacing: .large) {
      portraitGameCell
      portraitClassCell
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

  var landscapeHomeContent: some View {
    VStack(alignment: .center, spacing: .large) {
      landscapeGameCell
      landscapeClassCell
      HStack {
        Title(L10n.Home.developmentGuides)
        Spacer()
      }
      HStack {
        voiceOverGuide
        colorsGuide
        dynamicFontsGuide
        otherGuide
      }
      HStack {
        Title(L10n.AboutTheApp.title)
        Spacer()
      }
      HStack {
        aboutCell
        collaborationCell
        whatsNewCell
      }
    }
    .padding()
  }
}

// MARK: - GameCell

private extension PhoneHomeView {
  var portraitGameCell: some View {
    NavigationLink {
      GameView()
    } label: {
      HStack {
        Icon.gameController
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
        VStack {
          Text(L10n.Home.handbookGame)
            .font(.title3.bold())
          Comment(L10n.Home.handbookGameDescription)
        }
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

  var portraitClassCell: some View {
    NavigationLink {
      IndexView.classes()
    } label: {
      HStack {
        Icon.bookshelf
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
        VStack {
          Text(L10n.Home.classes)
            .font(.title3.bold())
          Comment(L10n.Home.classesDescription)
        }
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

  var landscapeGameCell: some View {
    NavigationLink {
      GameView()
    } label: {
      HStack(spacing: .regular) {
        Icon.gameController
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
        HorizontalSpace(.regular)
        VStack(alignment: .leading, spacing: .small) {
          Text(L10n.Home.handbookGame)
            .font(.title3.bold())
          Comment(L10n.Home.handbookGameDescription)
        }
      }
      .frame(maxWidth: .infinity)
      .accessibilityElement(children: .combine)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }

  var landscapeClassCell: some View {
    NavigationLink {
      IndexView.classes()
    } label: {
      HStack(spacing: .regular) {
        Icon.gameController
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
        HorizontalSpace(.regular)
        VStack(alignment: .leading, spacing: .small) {
          Text(L10n.Home.classes)
            .font(.title3.bold())
          Comment(L10n.Home.classesDescription)
        }
      }
      .frame(maxWidth: .infinity)
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

private extension PhoneHomeView {
  private var voiceOverGuide: some View {
    homeElement(
      icon: Icon.book,
      title: L10n.voiceOverGuide,
      destination: IndexView.voiceOverGuide()
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
      destination: IndexView.colors().toAny()
    )
  }

  private var dynamicFontsGuide: some View {
    homeElement(
      icon: Icon.textformat,
      title: L10n.Home.dynamicFonts,
      destination: IndexView.dynamicFonts().toAny()
    )
  }

  private var otherGuide: some View {
    homeElement(
      icon: Icon.circleHexagonpath,
      title: L10n.Home.otherFeatures,
      destination: IndexView.others().toAny()
    )
  }
}

// MARK: - About cells

private extension PhoneHomeView {
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

  @ViewBuilder
  var whatsNewCell: some View {
    if orientation.isLandscape {
      homeElement(
        icon: Icon.bookmark,
        title: L10n.WhatsNew.title,
        destination: WhatsNewView().toAny()
      )
    } else {
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
}

private extension PhoneHomeView {
  @ViewBuilder
  private func homeElement(icon: Image, title: String, destination: AnyView) -> some View {
    if orientation.isLandscape {
      largeHomeElement(icon: icon, title: title, destination: destination)
    } else {
      regularHomeElement(icon: icon, title: title, destination: destination)
    }
  }

  @ViewBuilder
  private func regularHomeElement(icon: Image, title: String, destination: AnyView) -> some View {
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
      .frame(maxWidth: UIScreen.main.bounds.width / 2,
             minHeight: 150.0)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }

  @ViewBuilder
  private func largeHomeElement(icon: Image, title: String, destination: AnyView) -> some View {
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
      .frame(maxWidth: UIScreen.main.bounds.width / 2,
             minHeight: 100.0)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }
}
