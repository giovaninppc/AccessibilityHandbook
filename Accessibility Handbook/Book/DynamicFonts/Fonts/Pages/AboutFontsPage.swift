//
//  AboutFontsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct AboutFontsPage: View, Page {
  let title: String = L10n.AboutFonts.title

  var body: some View {
    PageContent(next: UIContentSizePage()) {
      Group {
        intro
        ExternalLink(link: "https://www.dafont.com", title: L10n.AboutFonts.link)
      }
      .toAny()
    }
  }
}

private extension AboutFontsPage {
  var intro: some View {
    Group {
      Comment(L10n.AboutFonts.Intro.comment1)
      Text(L10n.AboutFonts.Intro.text1)
      Text(L10n.AboutFonts.Intro.text2)
      Comment(L10n.AboutFonts.Intro.comment2)
      Text(L10n.AboutFonts.Intro.text3)
      Text(L10n.AboutFonts.Intro.text4)
      Text(L10n.AboutFonts.Intro.text5)
      Comment(L10n.AboutFonts.Intro.comment3)
      Text(L10n.AboutFonts.Intro.text6)
      Comment(L10n.AboutFonts.Intro.comment4)
    }
  }
}
