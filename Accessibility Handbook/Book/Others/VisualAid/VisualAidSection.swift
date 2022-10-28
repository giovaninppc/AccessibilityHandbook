//
//  VisualAisSection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 28/10/22.
//

import Foundation

struct VisualAidSection: Section {
  let title: String = L10n.visualAid
  let pages: [Page] = [
    ButtonShapesPage()
  ]
}
