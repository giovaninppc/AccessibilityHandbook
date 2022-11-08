//
//  PhoneHomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/11/22.
//

import SwiftUI

struct PadHomeView: View {
  @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation

  var body: some View {
    homeContent
    .onRotate { newOrientation in
      orientation = newOrientation
    }
  }
}

// MARK: - Constants

extension PadHomeView {
  enum Constants {
    static let largeIcon: CGFloat = 50.0
    static let smallIcon: CGFloat = 30.0
    static let maxItemWidth: CGFloat = UIScreen.main.bounds.width / 4.5
  }
}

// MARK: - Content

private extension PadHomeView {
  @ViewBuilder
  var homeContent: some View {
    VStack(alignment: .center, spacing: .large) {
      gameCell
      HStack {
        Title(L10n.Home.developmentGuides)
        Spacer()
      }
      .padding(.horizontal, .small)
      HStack {
        guides
      }
      HStack {
        Title(L10n.Home.shortcuts)
        Spacer()
      }
      .padding(.horizontal, .small)
      VStack {
        HStack {
          shortcuts
        }
        HStack {
          shortcuts2
        }
      }
      HStack {
        Title(L10n.AboutTheApp.title)
        Spacer()
      }
      .padding(.horizontal, .small)
      HStack {
        abouts
      }
    }
    .padding(.vertical)
    .padding(.horizontal, .large)
  }

  @ViewBuilder
  var guides: some View {
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
    homeElement(
      icon: Icon.paintpalete,
      title: L10n.ColorsGuide.title,
      destination: IndexView(sections: ColorsSection()).toAny()
    )
    homeElement(
      icon: Icon.textformat,
      title: L10n.Home.dynamicFonts,
      destination: IndexView(sections: DynamicFontSections()).toAny()
    )
    homeElement(
      icon: Icon.circleHexagonpath,
      title: L10n.Home.otherFeatures,
      destination: IndexView(sections: OthersSections()).toAny()
    )
  }

  @ViewBuilder
  var shortcuts: some View {
    shortcutElement(
      icon: Icon.raisedHands,
      title: L10n.Gestures.title,
      destination: GesturesPage().page
    )
    shortcutElement(
      icon: Icon.eyeglasses,
      title: L10n.visualAid,
      destination: ButtonShapesPage().page
    )
    shortcutElement(
      icon: Icon.lightSwitch,
      title: L10n.darkMode,
      destination: WhatIsDarkModePage().page
    )
    shortcutElement(
      icon: Icon._3d,
      title: L10n.motion,
      destination: ReduceMotionPage().page
    )
  }

  @ViewBuilder
  var shortcuts2: some View {
    shortcutElement(
      icon: Icon.tap,
      title: L10n.interactrion,
      destination: ActivatePage().page
    )
    shortcutElement(
      icon: Icon.paintbrush,
      title: L10n.Home.colors,
      destination: AboutColorsPage().page
    )
    shortcutElement(
      icon: Icon.vibrations,
      title: L10n.haptics,
      destination: HapticsPage().page
    )
    shortcutElement(
      icon: Icon.exclamation,
      title: L10n.Home.notifications,
      destination: AnnouncementPage().page
    )
  }

  @ViewBuilder
  var abouts: some View {
    homeElement(
      icon: Icon.questionMarkDashed,
      title: L10n.AboutTheApp.title,
      destination: AboutTheAppView().toAny()
    )
    homeElement(
      icon: Icon.textRedaction,
      title: L10n.Home.collaborate,
      destination: CollaborationView().toAny()
    )
    homeElement(
      icon: Icon.bookmark,
      title: L10n.WhatsNew.title,
      destination: WhatsNewView().toAny()
    )
  }
}

// MARK: - GameCell

private extension PadHomeView {
  var gameCell: some View {
    NavigationLink {
      GameView()
    } label: {
      HStack(spacing: .regular) {
        Icon.gameController
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: Constants.largeIcon, height: Constants.largeIcon)
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
}

private extension PadHomeView {
  @ViewBuilder
  private func shortcutElement(icon: Image, title: String, destination: AnyView) -> some View {
    NavigationLink {
      destination
    } label: {
      HStack {
        icon
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(
            width: Constants.smallIcon,
            height: Constants.smallIcon
          )
        HorizontalSpace(.regular)
        Text(title)
          .font(.body.bold())
          .multilineTextAlignment(.leading)
          .minimumScaleFactor(0.5)
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .frame(
        minHeight: 45.0
      )
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
    .frame(
      maxWidth: Constants.maxItemWidth
    )
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
          .frame(width: Constants.largeIcon, height: Constants.largeIcon)
        Spacer()
        Text(title)
          .font(.title3.bold())
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .frame(
        minWidth: 150.0,
        maxWidth: UIScreen.main.bounds.width / 4.7,
        minHeight: 100.0
      )
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
    .frame(
      maxWidth: Constants.maxItemWidth
    )
  }
}
