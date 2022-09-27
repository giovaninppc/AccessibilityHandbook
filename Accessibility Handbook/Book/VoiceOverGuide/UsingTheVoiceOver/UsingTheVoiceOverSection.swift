//
//  UsingTheVoiceOverSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Foundation

struct UsingTheVoiceOverSection: Section {
  let title: String = L10n.usingTheVoiceOver
  let pages: [Page] = [
    EnableVoiceOverPage(),
    NavigationPage(),
    GesturesPage(),
    ElementReadingOrderPage(),
    RotorPage(),
    RotorAndHeadersPage()
  ]
}
