//
//  HierarchyBackgroundModifier.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HierarchyBackgroundModifier: ViewModifier {
  let color: Color
  let opacity: Double

  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(color)
          .opacity(opacity)
      }
  }
}

extension View {
  func hierarchyBackground(color: Color = .blue, opacity: Double = 0.2) -> some View {
    modifier(HierarchyBackgroundModifier(color: color, opacity: opacity))
  }
}
