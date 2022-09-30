//
//  File.swift
//  
//
//  Created by Giovani Nascimento Pereira on 30/09/22.
//

import SwiftUI

struct AccessibilityIndex: View {
  @State private var text: String = ""

  init() {}

  var body: some View {
    ScrollView {
      if text.isEmpty {
        index
      } else {
        SearchView(text: $text)
      }
    }
    .searchable(text: $text, placement: .navigationBarDrawer)
    .navigationTitle(L10n.title)
    .navigationViewStyle(.stack)
  }
}

extension AccessibilityIndex {
  var index: some View {
    VStack(alignment: .leading, spacing: .large) {
      Text(L10n.indexInfo)
      NavigationLink {
        IndexView(sections: VoiceOverGuideSections())
      } label: {
        AccessibilityIndexCell(title: L10n.Gestures.title, icon: Icon.raisedHands)
      }

      NavigationLink {
        IndexView(sections: VoiceOverGuideSections())
          .toolbar {
            NavigationLink {
              GesturesPage()
            } label: {
              Icon.raisedHands
            }
            .accessibilityLabel(L10n.Gestures.title)
          }
      } label: {
        AccessibilityIndexCell(title: L10n.voiceOverGuide, icon: Icon.book)
      }

      NavigationLink {
        IndexView(sections: ColorsSection())
      } label: {
        AccessibilityIndexCell(title: L10n.ColorsGuide.title, icon: Icon.paintpalete)
      }

      NavigationLink {
        IndexView(sections: DynamicFontSections())
      } label: {
        AccessibilityIndexCell(title: L10n.Home.dynamicFonts, icon: Icon.textformat)
      }

      NavigationLink {
        IndexView(sections: OthersSections())
      } label: {
        AccessibilityIndexCell(title: L10n.Home.otherFeatures, icon: Icon.circleHexagonpath)
      }
    }
    .padding()
  }
}

struct AccessibilityIndexCell: View {
  let title: String
  let icon: Image?

  init(title: String, icon: Image? = nil) {
    self.title = title
    self.icon = icon
  }

  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      HStack {
        displayTitle
          .font(.title3)
          .padding(.horizontal, .regular)
          .padding(.vertical, .regular)
        Spacer()
        Icon.chevronForward
          .padding()
      }
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
      Rectangle()
        .frame(height: 1.0)
        .foregroundColor(.secondaryBackground)
    }
    .accessibilityElement(children: .combine)
    .accessibilityAddTraits(.isButton)
  }

  private var displayTitle: some View {
    Group {
      if let icon = icon {
        (Text(icon) + Text(String.space) + Text(String.space) + Text(title))
      } else {
        Text(title)
      }
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(title)
  }
}
