//
//  NewSceneClassSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/12/22.
//

import Foundation

struct IdentifyIssues: Section {
  let title: String = L10n.IdentifyIssues.title

  let pages: [Page] = [
    UngroupedElements(),
    MixOfColorsPage()
  ]
}
