//
//  ContrastPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct ContrastPage: View, Page {
  let title: String = L10n.Contrast.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        example
      }
      .toAny()
    }
  }
}

// MARK: - Intro

private extension ContrastPage {
  var intro: some View {
    Group {
      Text(L10n.Contrast.text1)
      ExternalLink(
        link: "https://en.wikipedia.org/wiki/Contrast_(vision)",
        title: L10n.moreOnWikipedia
      )
      Comment(L10n.Contrast.comment1)
      Text(L10n.Contrast.text2)
      Text(L10n.Contrast.text3)
      Comment(L10n.Contrast.comment2)
    }
  }
}

// MARK: - Examples

private extension ContrastPage {
  var example: some View {
    Group {
      Text(L10n.Contrast.Example.text1)
      Comment(L10n.Contrast.Example.comment1)

      exampleItem(foreground: .red, background: .yellow)
      Comment(L10n.Contrast.Example.example1)

      exampleItem(foreground: .black, background: .pink)
      Comment(L10n.Contrast.Example.example2)

      exampleItem(foreground: .black, background: .white)
      Comment(L10n.Contrast.Example.example3)

      ExternalLink(link: "https://contrastchecker.com/", title: L10n.Contrast.Example.link)
    }
  }

  @ViewBuilder
  func exampleItem(foreground: Color, background: Color) -> some View {
    Centered {
      VStack(spacing: .small) {
        Text(L10n.regularText)
        Text(L10n.boldText)
          .bold()
      }
      .padding()
      .foregroundColor(foreground)
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(background)
      }
      .toAny()
    }
  }
}
