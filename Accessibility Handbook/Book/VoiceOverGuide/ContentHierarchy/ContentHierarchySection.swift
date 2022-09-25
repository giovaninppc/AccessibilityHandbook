//
//  ContentHierarchySection.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import Foundation

struct ContentHierarchySectionSection: Section {
  let title: String = L10n.contentHiererachy
  let pages: [Page] = [
    ModalViewPage(),
    GroupingPage()
  ]
}
