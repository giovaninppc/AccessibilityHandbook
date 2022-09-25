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
    PageContent(next: ButtonTraitPage()) {
      Group {
        Text("Here's a full list of accessibility traits. Some of them are further discussed on this app")
        Comment("Since I think they are the most important ones and I actually have something to talk about. (Or I just didn't have the time yet to write something nice about this trait)")
        Text("Others are more obvious about how they should work, and where they should be used.")
        Comment("But make sure to check all of their documentations!")

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
        description: "Tells that the item is a button - can be activated with a double tap.",
        internalLink: ButtonTraitPage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620194-button"
      )

      listItem(
        name: "adjustable",
        description: "Allows gestures to update quantities. This is quite useful in some situations like quick-adds, sliders or counters!",
        internalLink: AdjustablePage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620177-adjustable"
      )

      listItem(
        name: "header",
        description: "A header that can be focused with rotor function. Indicates the begining of a new section.",
        internalLink: HeaderTraitPage().page,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620170-header"
      )

      listItem(
        name: "link",
        description: "A link to a web page",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620178-link"
      )

      listItem(
        name: "image",
        description: "An image. It may not seem, but its important to use when actually focusing on an image. The user may want to share the image with someone, or print screen it to ask more later...",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620174-image"
      )

      listItem(
        name: "searchField",
        description: "Allows typing and when finished will search for something.",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620199-searchfield"
      )

      listItem(
        name: "keyboardKey",
        description: "A keyboard key. (Probably not very relevant if you are not creating a custom keyboard)",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620182-keyboardkey"
      )

      listItem(
        name: "staticText",
        description: "A text that does not change",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620206-statictext"
      )

      listItem(
        name: "tabbar",
        description: "A tabbar item, actually very important if you have a custom tabbar!",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1648592-tabbar"
      )

      listItem(
        name: "summaryElement",
        description: "\"The accessibility element provides summary information when the app starts.\"",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620185-summaryelement"
      )
    }
  }

  private var part02: some View {
    Group {
      listItem(
        name: "selected",
        description: "A selected item - used when there are more items on a list that can be selected as well (segmented controllers, radio buttons…)",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620185-summaryelement"
      )

      listItem(
        name: "notEnabled",
        description: "The content interaction is disabled - eg: a disabled button",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620208-notenabled"
      )

      listItem(
        name: "allowsDirectInteraction",
        description: "The accessibility element allows direct touch interaction for VoiceOver users.",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620172-allowsdirectinteraction"
      )

      listItem(
        name: "updatesFrequently",
        description: "The value or label frequently changes.",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620187-updatesfrequently"
      )

      listItem(
        name: "causesPageTurn",
        description: "Makes an automatic page turn when it finished reading the element.",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620205-causespageturn"
      )

      listItem(
        name: "playsSound",
        description: "Plays sound when activated",
        internalLink: nil,
        externalLink: "https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620204-playssound"
      )

      listItem(
        name: "startsMediaSession",
        description: "Starts playing from a media session.",
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
