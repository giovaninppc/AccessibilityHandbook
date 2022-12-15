//
//  NewSceneClassSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct TestingClassSection: Section {
  let title: String = L10n.TestingForAccessibility.title

  let pages: [Page] = [
    AccessibilityInspectorPage(),
    RunTheAppInRealLifePage()
  ]
}
