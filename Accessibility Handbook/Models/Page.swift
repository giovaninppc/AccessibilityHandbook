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
    String(describing: self.self)
  }

  var deeplink: String {
    baseDeeplinkScheme + "://" +
    title.replacingOccurrences(of: String.space, with: String.empty).lowercased()
  }
}
