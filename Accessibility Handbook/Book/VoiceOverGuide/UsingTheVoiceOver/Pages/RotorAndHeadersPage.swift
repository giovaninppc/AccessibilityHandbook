//
//  RotorAndHeaders.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct RotorAndHeadersPage: View, Page {
  let title: String = L10n.RotorAndHeaders.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        rotor
        header
        together
        example
      }
      .toAny()
    }
  }

  private var rotor: some View {
    Group {
      Title(L10n.rotor)
      Text(L10n.RotorAndHeaders.Rotor.text)
      InternalLink(page: RotorPage().page, title: L10n.rotor)
    }
  }

  private var header: some View {
    Group {
      Title(L10n.HeaderTrait.title)
      Text(L10n.RotorAndHeaders.Header.text1)
      Text(L10n.RotorAndHeaders.Header.text2)
      InternalLink(page: HeaderTraitPage().page, title: L10n.HeaderTrait.title)
    }
  }

  private var together: some View {
    Group {
      Title(L10n.RotorAndHeaders.Together.title)
      Text(L10n.RotorAndHeaders.Together.text2)
      Text(L10n.RotorAndHeaders.Together.text2)
      Text(L10n.RotorAndHeaders.Together.text3)
    }
  }

  private var example: some View {
    Group {
      Title(L10n.example)
      Text(L10n.RotorAndHeaders.Example.text1)
      Text(L10n.RotorAndHeaders.Example.text2)
    }
  }
}

