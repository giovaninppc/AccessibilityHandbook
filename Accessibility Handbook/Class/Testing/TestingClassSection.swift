//
//  NewSceneClassSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct TestingClassSection: Section {
  let title: String = "Testing for Accessibility"
  let pages: [Page] = [
    AccessibilityInspectorPage(),
    RunTheAppInRealLifePage()
  ]
}
