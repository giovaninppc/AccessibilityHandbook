//
//  OthersSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct OthersSections: SectionProvider {
  let title: String = L10n.Home.otherFeatures
  let sections: [Section] = [
    HapticsSection(),
    MotionSection()
  ]
}
