//
//  Sections.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Foundation

protocol Section {
  var id: String { get }
  var title: String { get }
  var pages: [Page] { get }
}

extension Section {
  var id: String { String(describing: self.self) }
}
