//
//  Flip.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 03/10/22.
//

import SwiftUI

struct Flip: View {
  @Binding var flipped: Bool
  let front: () -> AnyView
  let back: () -> AnyView

  @Environment(\.accessibilityReduceMotion) private var accessibilityReduceMotion

  var body: some View {
    ZStack {
      front()
        .opacity(flipped ? 0.0 : 1.0)
        .rotation3DEffect(flipped ? .radians(-.pi) : .zero, axis: (x: 0.0, y: 1.0, z: 0.0))
      back()
        .opacity(flipped ? 1.0 : 0.0)
        .rotation3DEffect(flipped ? .zero : .radians(.pi), axis: (x: 0.0, y: 1.0, z: 0.0))
    }
    .animation(accessibilityReduceMotion ? .none : .easeInOut.speed(0.5), value: flipped)
    .onTapGesture { self.flipped.toggle() }
  }
}
