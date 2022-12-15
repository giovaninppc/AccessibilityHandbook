//
//  AdjustableModifier.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct AdjustableModifier: ViewModifier {
  @Binding var value: Int

  func body(content: Content) -> some View {
    content
      .accessibilityElement(children: .combine)
      .accessibilityValue("\(value)")
      .accessibilityAdjustableAction { direction in
        switch direction {
        case .decrement:
          value -= 1
        case .increment:
          value += 1
        @unknown default:
          break
        }
      }
  }
}

extension View {
  func adjustable(value: Binding<Int>) -> some View {
    modifier(AdjustableModifier(value: value))
  }
}
