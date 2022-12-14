//
//  NewSceneClassSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct NewSceneClassSection: Section {
  let title: String = L10n.MakingANewScene.title

  let pages: [Page] = [
    UnderstandHowComponentsInteractPage(),
    HiddenObjectsPage(),
    FigureDifferentFontScalesPage(),
    IsItAModalPage(),
    HandleAnimationsPage(),
    NavigationAndDismissPage(),
    AccessibilityShortcutsPage()
  ]
}
