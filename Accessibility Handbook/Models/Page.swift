//
//  Page.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

protocol Page {
  var id: String { get }
  var title: String { get }
  var page: AnyView { get }
  var deeplink: String { get }
}

extension Page where Self: View {
  var page: AnyView {
    AnyView(self.navigationTitle(self.title))
  }

  var id: String {
    let base = String(describing: self.self)
    let split = base.split(separator: "(").map { String($0) }
    return (split.first ?? base)
      .replacingOccurrences(of: String.space, with: String.empty)
      .lowercased()
  }

  var deeplink: String {
    baseDeeplinkScheme + "://" + id
  }
}
