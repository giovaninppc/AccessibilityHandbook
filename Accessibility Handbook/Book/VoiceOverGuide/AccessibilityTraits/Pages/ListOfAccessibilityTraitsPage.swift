//
//  ListOfAccessibilityTraitsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ListOfAccessibilityTraitsPage: View, Page {
  var title: String = L10n.ListOfTraits.title

  var body: some View {
    PageContent(next: ButtonTraitPage(), deeplink: deeplink) {
      Group {
        Text(L10n.ListOfTraits.text1)
        Comment(L10n.ListOfTraits.comment1)
        Text(L10n.ListOfTraits.text2)
        Comment(L10n.ListOfTraits.comment2)

        listOfTraits
      }
      .toAny()
    }
  }

  private var listOfTraits: some View {
    Group {
      part01
      part02
    }
  }

  private var part01: some View {
    Group {
      listItem(
        name: "button",
        description: L10n.ListOfTraits.button,
        internalLink: ButtonTraitPage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620194-button"
      )

      listItem(
        name: "adjustable",
        description: L10n.ListOfTraits.adjustable,
        internalLink: AdjustablePage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620177-adjustable"
      )

      listItem(
        name: "header",
        description: L10n.ListOfTraits.header,
        internalLink: HeaderTraitPage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620170-header"
      )

      listItem(
        name: "link",
        description: L10n.ListOfTraits.link,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620178-link"
      )

      listItem(
        name: "image",
        description: L10n.ListOfTraits.image,
        internalLink: ImageTraitPage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620174-image"
      )

      listItem(
        name: "searchField",
        description: L10n.ListOfTraits.searchField,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620199-searchfield"
      )

      listItem(
        name: "keyboardKey",
        description: L10n.ListOfTraits.keyboardKey,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620182-keyboardkey"
      )

      listItem(
        name: "staticText",
        description: L10n.ListOfTraits.staticText,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620206-statictext"
      )

      listItem(
        name: "tabbar",
        description: L10n.ListOfTraits.tabbar,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1648592-tabbar"
      )

      listItem(
        name: "summaryElement",
        description: L10n.ListOfTraits.summaryElement,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620185-summaryelement"
      )
    }
  }

  private var part02: some View {
    Group {
      listItem(
        name: "selected",
        description: L10n.ListOfTraits.selected,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620185-summaryelement"
      )

      listItem(
        name: "notEnabled",
        description: L10n.ListOfTraits.notEnabled,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620208-notenabled"
      )

      listItem(
        name: "allowsDirectInteraction",
        description: L10n.ListOfTraits.allowsDirectInteraction,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620172-allowsdirectinteraction"
      )

      listItem(
        name: "updatesFrequently",
        description: L10n.ListOfTraits.updatesFrequently,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620187-updatesfrequently"
      )

      listItem(
        name: "causesPageTurn",
        description: L10n.ListOfTraits.causesPageTurn,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620205-causespageturn"
      )

      listItem(
        name: "playsSound",
        description: L10n.ListOfTraits.playsSound,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620204-playssound"
      )

      listItem(
        name: "startsMediaSession",
        description: L10n.ListOfTraits.startsMediaSession,
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620173-startsmediasession"
      )
    }
  }

  @ViewBuilder
  private func listItem(name: String, description: String, internalLink: AnyView?, externalLink: String?) -> some View {
    VStack(alignment: .leading, spacing: .regular) {
      Text("• \(name)")
        .font(.body.bold())
        .accessibilityLabel(Text(name))
      Comment(description)
            .fixedSize(horizontal: false, vertical: true)
      HStack(spacing: .large) {
        if let externalLink = externalLink {
          ExternalLink(link: externalLink, title: L10n.moreOnTheWeb)
        }
        if let internalLink = internalLink {
          InternalLink(page: internalLink, title: L10n.dedicatedPage)
        }
      }
      Rectangle()
        .frame(height: .single)
        .foregroundColor(.secondaryBackground)
        .accessibilityHidden(true)
    }
  }
}
