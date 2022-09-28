//
//  SightDeficiences.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct SightDeficiencesPage: View, Page {
  let title: String = "Sight deficiencies"

  var body: some View {
    PageContent(next: SizeAndWeightPage()) {
      Group {
        intro
        ExternalLink(link: "https://www.dafont.com/pt/", title: L10n.AboutFonts.link)
      }
      .toAny()
    }
  }
}

private extension SightDeficiencesPage {
  var intro: some View {
    Group {

    }
  }
}
