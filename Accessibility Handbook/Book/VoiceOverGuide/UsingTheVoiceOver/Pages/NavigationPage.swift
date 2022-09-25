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
      Title(L10n.Navigation.MoveAround.title)
      Text(L10n.Navigation.MoveAround.text1)
      Text(L10n.Navigation.MoveAround.text2)
    }
  }

  var activate: some View {
    Group {
      Title(L10n.Navigation.Activate.title)
      Text(L10n.Navigation.Activate.text)
      Comment(L10n.Navigation.Activate.comment)
      InternalLink(page: ActivatePage().page, title: L10n.interactrion)
    }
  }

  var footer: some View {
    Group {
      Title(L10n.Navigation.Footer.title)
      Text(L10n.Navigation.Footer.text1)
      Text(L10n.Navigation.Footer.text2)
      Text(L10n.Navigation.Footer.text3)
      Comment(L10n.Navigation.Footer.comment)
    }
  }
}
