//
//  ImplementDynamicFontsSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import Foundation

struct ImplementingDynamicFontsSection: Section {
  let title: String = L10n.DynamicFonts.implementing
  let pages: [Page] = [
    ScallingFontsAutomaticallyPage(),
    UIFontMetricsPage(),
    AdjustLayoutToScaledFontPage()
  ]
}
