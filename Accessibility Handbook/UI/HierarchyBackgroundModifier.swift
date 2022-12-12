//
//  HierarchyBackgroundModifier.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HierarchyBackgroundModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.blue)
          .opacity(0.2)
      }
  }
}

extension View {
  func hierarchyBackground() -> some View {
    modifier(HierarchyBackgroundModifier())
  }
}
