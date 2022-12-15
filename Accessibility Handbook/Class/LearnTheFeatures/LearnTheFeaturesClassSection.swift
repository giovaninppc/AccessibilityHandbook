//
//  LearnTheFeaturesClassSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct LearnTheFeaturesClassSection: Section {
  let title: String = L10n.LearnAccessibility.title

  let pages: [Page] = [
    ThinkingAccessibilityPage(),
    TeamGamePage(),
    LearnTheFeaturesPage(),
    TryItYourselfPage()
  ]
}
