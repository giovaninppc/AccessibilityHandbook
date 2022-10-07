//
//  DarkModeSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import Foundation

struct DarkModeSection: Section {
  let title: String = L10n.darkMode

  let pages: [Page] = [
    WhatIsDarkModePage(),
    AppearancesPage(),
    DynamicColorsPage(),
    DynamicColoredAssetsPage(),
    TintableImagesPage()
  ]
}
