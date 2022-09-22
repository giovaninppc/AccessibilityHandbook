//
//  ColorsIntroSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct ColorsIntroSections: Section {
  let title: String = "Introduction"
  let pages: [Page] = [
    AboutColorsPage(),
    ColorBlindnessPage(),
//    ConstrastPage()
  ]
}
