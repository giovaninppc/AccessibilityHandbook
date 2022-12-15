//
//  NewViewClassSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct NewViewClassSection: Section {
  let title: String = L10n.MakingANewView.title

  let pages: [Page] = [
    PlanBeforeYouImplementPage(),
    RepeatedViewsPage(),
    HandlingImagesAndIconsPage(),
    AddTheCorrectTraitsPage(),
    HandleAllTheViewActionsPage(),
    ValidateColorsPage()
  ]
}
