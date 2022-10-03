//
//  MotionSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 03/10/22.
//

import Foundation

struct MotionSection: Section {
  let title: String = L10n.motion
  let pages: [Page] = [
    ReduceMotionPage(),
    PreferCrossFadePage()
  ]
}
