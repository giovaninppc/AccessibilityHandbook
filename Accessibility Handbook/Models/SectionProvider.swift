//
//  SectionProvider.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import Foundation

protocol SectionProvider {
  var sections: [Section] { get }
  var title: String { get }
}


struct GenericSectionProvider: SectionProvider {
  let sections: [Section]
  let title: String

  init(pages: [Page], title: String) {
    self.sections = [
      GenericSection(
        title: title,
        pages: pages
      )
    ]
    self.title = title
  }
}

private struct GenericSection: Section {
  var title: String
  var pages: [Page]
}
