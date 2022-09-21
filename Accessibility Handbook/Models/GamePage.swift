//
//  Gameage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

protocol GamePage: Page {
  var completed: Bool { get }
  var hintPage: AnyView { get }
}

extension GamePage where Self: View {
  var page: AnyView {
    self.navigationTitle(self.title).toAny()
  }
}
