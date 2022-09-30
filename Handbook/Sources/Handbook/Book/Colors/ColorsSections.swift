//
//  ColorsSections.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct ColorsSection: SectionProvider {
  let title: String = L10n.ColorsGuide.title
  let sections: [Section] = [
    ColorsIntroSections(),
    ColorsAccessibilityFeaturesSection()
  ]
}
