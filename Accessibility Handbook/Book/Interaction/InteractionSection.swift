//
//  InteractionSwction.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Foundation

struct InteractionSection: Section {
  let title: String = "Interaction"
  let pages: [Page] = [
    ActivatePage(),
    LongPressPage(),
    AdjustablePage(),
    CustomActionsPage()
  ]
}
