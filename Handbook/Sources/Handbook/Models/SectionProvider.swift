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
