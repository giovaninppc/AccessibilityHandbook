//
//  UsingTheVoiceOverSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Foundation

struct UsingTheVoiceOverSection: Section {
  let title: String = "Using the Voice-Over"
  let pages: [Page] = [
    NavigationPage(),
    ElementReadingOrderPage(),
    RotorPage(),
    RotorAndHeadersPage()
  ]
}
