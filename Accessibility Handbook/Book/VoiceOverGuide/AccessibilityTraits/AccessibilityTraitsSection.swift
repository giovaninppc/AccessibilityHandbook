//
//  AccessibilityTraitsSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct AccessibilityTraitsSection: Section {
  let title: String = "Accessibility Traits"
  let pages: [Page] = [
    ListOfAccessibilityTraitsPage(),
    ButtonTraitPage(),
    HeaderTraitPage()
  ]
}
