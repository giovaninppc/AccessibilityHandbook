//
//  Navigation.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct NavigationPage: View, Page {
  var title: String = L10n.Navigation.title

  var body: some View {
    PageContent(next: ElementReadingOrderPage()) {
      Group {
        intro
        VerticalSpace(.regular)
        moveAround
        VerticalSpace(.regular)
        activate
        VerticalSpace(.regular)
        footer
      }
      .toAny()
    }
  }
}

private extension NavigationPage {
  var intro: some View {
    Group {
      Text(L10n.Navigation.text1)
      Text(L10n.Navigation.text2)
      Asset.cursor.swiftUIImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .accessibilityLabel(L10n.Navigation.image)
      Comment(L10n.Navigation.imageSubtitle)
      Text(L10n.Navigation.text3)
      Text(L10n.Navigation.text4)
      Comment(L10n.Navigation.comment)
    }
  }

  var moveAround: some View {
    Group {
      Title("Move around")
      Text("When the Voice-Over is enabled, swipe horizontally from left to right to move the cursor to focus on the next element.")
      Text("And swipe from right to left to focus on the previous element.")
    }
  }

  var activate: some View {
    Group {
      Title("Activate an element")
      Text("Activate, is the Voice-Over version of tapping an item. Double tap with a single finger to activate an element.")
      Comment("You can learn more about ways to interact with elements on the 'Interaction' section")
      InternalLink(page: ActivatePage().page, title: "Interaction")
    }
  }

  var footer: some View {
    Group {
      Title("Learn more gestures")
      Text("If you tap with 4 fingers twice with the Voice-Over enabled, you will activate the 'Gesture Helper'.")
      Text("Now, every gesture you make will be announced by the Voice-Over, followed by it's function.")
      Text("And to disable the helper, tap twice with 4 fiongers again!")
      Comment("These are just a few of the gestures available. We plan on adding a full gesture section in the future, but for now, I suggest you try it for yourself, turn the Voice-Over on and test the gestures using the 'Gesture Help'.")
    }
  }
}
