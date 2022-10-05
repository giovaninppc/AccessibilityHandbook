//
//  WipSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct FontsSection: Section {
  var title: String = L10n.Fonts.title
  var pages: [Page] = [
    AboutFontsPage(),
    UIContentSizePage()
  ]
}
