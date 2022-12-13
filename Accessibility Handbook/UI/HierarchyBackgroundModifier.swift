//
//  HierarchyBackgroundModifier.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HierarchyBackgroundModifier: ViewModifier {
  let color: Color

  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(color)
          .opacity(0.2)
      }
  }
}

extension View {
  func hierarchyBackground(color: Color = .blue) -> some View {
    modifier(HierarchyBackgroundModifier(color: color))
  }
}
