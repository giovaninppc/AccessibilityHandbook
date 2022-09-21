//
//  ToAny.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

extension View {
  func toAny() -> AnyView {
    AnyView(self)
  }
}
