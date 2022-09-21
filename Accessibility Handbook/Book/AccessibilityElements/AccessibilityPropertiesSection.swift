//
//  AccessibilityLabelSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Foundation

struct AccessibilityPropertiesSection: Section {
  let title: String = L10n.AccElements.title

  let pages: [Page] = [
    AccessibilityElementPage(),
    AccessibilityLabelPage(),
    AccessibilityHintPage(),
    AccessibilityTraitPage(),
    AccessibilityValuePage()
  ]
}
