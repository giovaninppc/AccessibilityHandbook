//
//  SizeAndWeightPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct SizeAndWeightPage: View, Page {
  let title: String = L10n.SizeAndWeight.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        ExternalLink(link: "https://www.dafont.com", title: L10n.AboutFonts.link)
      }
      .toAny()
    }
  }
}

private extension SizeAndWeightPage {
  var intro: some View {
    Group {

    }
  }
}
