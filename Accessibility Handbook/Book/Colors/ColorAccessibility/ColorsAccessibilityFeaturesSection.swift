//
//  TransparencySection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct ColorsAccessibilityFeaturesSection: Section {
  let title: String = "Color Accessibility Features"
  let pages: [Page] = [
    ReduceTransparencyPage(),
    DifferentiateWithColorsPage(),
    InvertColorsPage()
  ]
}
