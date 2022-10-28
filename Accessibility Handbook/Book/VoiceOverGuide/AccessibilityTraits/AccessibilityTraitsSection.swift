//
//  AccessibilityTraitsSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct AccessibilityTraitsSection: Section {
  let title: String = L10n.AccTraits.title
  let pages: [Page] = [
    ListOfAccessibilityTraitsPage(),
    ButtonTraitPage(),
    HeaderTraitPage(),
    ImageTraitPage()
  ]
}
