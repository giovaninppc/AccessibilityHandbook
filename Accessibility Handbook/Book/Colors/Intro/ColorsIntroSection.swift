//
//  ColorsIntroSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct ColorsIntroSections: Section {
  let title: String = L10n.ColorsGuide.introduction
  let pages: [Page] = [
    AboutColorsPage(),
    ColorBlindnessPage(),
    ContrastPage()
  ]
}
