//
//  IndexView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct IndexView: View {
  let sections: SectionProvider
  let openDeeplink: Deeplink?
  let shouldOpenDeeplinkOnStart: Bool

  @State private var hasDeeplinked: Bool = false

  init(sections: SectionProvider, openDeeplink: Deeplink? = nil, shouldOpenDeeplinkOnStart: Bool = false) {
    self.sections = sections
    self.openDeeplink = openDeeplink
    self.shouldOpenDeeplinkOnStart = shouldOpenDeeplinkOnStart
  }

  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(sections.sections, id: \.id) { section in
          Text(section.title)
            .font(.headline)
            .padding(.top, 30.0)
            .padding(.leading, .regular)
            .accessibilityAddTraits(.isHeader)
          ForEach(section.pages, id: \.id) { page in
            NavigationLink {
              page.page
            } label: {
              IndexCell(title: page.title)
            }
          }
        }
      }
    }
    .navigationTitle(sections.title)
    .onAppear {
      guard let deeplink = openDeeplink, shouldOpenDeeplinkOnStart, !hasDeeplinked else { return }
      open(deeplink)
      hasDeeplinked = true
    }
  }
}

// Helpers

extension IndexView {
  static func classes() -> some View {
    IndexView(
      sections: ClassSections(),
      openDeeplink: CustomPageDeeplinks.classWelcomeDeeplink(),
      shouldOpenDeeplinkOnStart: !ClassWelcome.hasStartedClasses
    )
    .toolbar {
      Button {
        open(CustomPageDeeplinks.classWelcomeDeeplink())
      } label: {
        Icon.infoCircle
      }
      .accessibilityLabel(L10n.AccessibilityWelcome.more)
    }
  }

  static func voiceOverGuide() -> some View {
    IndexView(sections: VoiceOverGuideSections())
  }

  static func colors() -> some View {
    IndexView(sections: ColorsSection())
  }

  static func dynamicFonts() -> some View {
    IndexView(sections: DynamicFontSections())
  }

  static func others() -> some View {
    IndexView(sections: OthersSections())
  }

  static func motion() -> some View {
    index(for: MotionSection())
  }

  static func visualAid() -> some View {
    index(for: VisualAidSection())
  }

  static func darkMode() -> some View {
    index(for: DarkModeSection())
  }

  static func voiceOverInteraction() -> some View {
    index(for: InteractionSection())
  }

  static func rotorAndMagicTap() -> some View {
    IndexView(sections: GenericSectionProvider(pages: [RotorPage(), MagicTapPage()], title: L10n.rotor + .commaSpace + L10n.MagicTap.title))
  }

  // ---

  private static func index(for section: Section) -> some View {
    IndexView(sections: GenericSectionProvider(pages: section.pages, title: section.title))
  }
}

// Deeplinks

extension IndexView {
  static var deeplinks: [Deeplink: AnyView] {
    [
      classesDeeplink(): classes().toAny(),
      voiceOverGuideDeeplink(): voiceOverGuide().toAny(),
      colorsDeeplink(): colors().toAny(),
      dynamicFontsDeeplink(): dynamicFonts().toAny(),
      othersDeeplink(): others().toAny(),
      motionDeeplink(): motion().toAny(),
      voiceOverInteractionDeeplink(): voiceOverInteraction().toAny(),
      rotorAndMagicTapDeeplink(): rotorAndMagicTap().toAny(),
      visualAidDeeplink(): visualAid().toAny(),
      darkModeDeeplink(): darkMode().toAny()
    ]
  }

  static func classesDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "index/" + "class"
  }

  static func voiceOverGuideDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "index/" + "voiceoverguide"
  }

  static func colorsDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "index/" + "colors"
  }

  static func dynamicFontsDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "index/" + "dynamicfonts"
  }

  static func othersDeeplink() -> Deeplink {
    baseDeeplinkScheme + "://" + "index/" + "others"
  }

  static func motionDeeplink() -> Deeplink {
    othersDeeplink() + "/motion"
  }

  static func visualAidDeeplink() -> Deeplink {
    othersDeeplink() + "/visualaid"
  }

  static func voiceOverInteractionDeeplink() -> Deeplink {
    voiceOverGuideDeeplink() + "/interaction"
  }

  static func darkModeDeeplink() -> Deeplink {
    colorsDeeplink() + "/darkmode"
  }

  static func rotorAndMagicTapDeeplink() -> Deeplink {
    voiceOverGuideDeeplink() + "/rotorandmagictap"
  }
}
