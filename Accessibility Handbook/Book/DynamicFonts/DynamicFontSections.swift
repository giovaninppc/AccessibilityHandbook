//
//  DynamicFontSections.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct DynamicFontSections: SectionProvider {
  let title: String = L10n.DynamicFonts.title
  let sections: [Section] = [
    FontsSection(),
    ImplementingDynamicFontsSection()
  ]
}
