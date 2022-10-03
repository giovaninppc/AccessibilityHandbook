//
//  OthersSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

struct OthersSections: SectionProvider {
  let title: String = "Other Features"
  let sections: [Section] = [
    HapticsSection(),
    MotionSection()
  ]
}
