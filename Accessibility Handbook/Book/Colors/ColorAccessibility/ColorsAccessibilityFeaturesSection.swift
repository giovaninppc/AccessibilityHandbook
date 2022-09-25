//
//  TransparencySection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct ColorsAccessibilityFeaturesSection: Section {
  let title: String = L10n.colorAccessibilityFeatures

  let pages: [Page] = [
    ReduceTransparencyPage(),
    DifferentiateWithoutColorsPage(),
    InvertColorsPage(),
    IncreaseContrastPage()
  ]
}
