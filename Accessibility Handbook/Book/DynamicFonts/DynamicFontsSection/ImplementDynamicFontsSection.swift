//
//  ImplementDynamicFontsSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import Foundation

struct ImplementingDynamicFontsSection: Section {
  var title: String = "Implementing Dynamic Fonts"
  var pages: [Page] = [
    ScallingFontsAutomaticallyPage(),
    UIFontMetricsPage(),
    AdjustLayoutToScaledFontPage()
  ]
}
