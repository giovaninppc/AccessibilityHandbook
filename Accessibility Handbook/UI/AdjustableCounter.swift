//
//  AdjustableCounter.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct AdjustableCounter: View {
  @Binding var value: Int

  var body: some View {
    HStack {
      Spacer()
      Button {
        value -= 1
      } label: {
        Image(systemName: "minus.circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
      }
      .accessibilityHidden(true)

      HorizontalSpace(.regular)

      Text("\(value)")
        .font(.title.bold())

      HorizontalSpace(.regular)

      Button {
        value += 1
      } label: {
        Image(systemName: "plus.circle.fill")
          .resizable()
          .frame(width: 30.0, height: 30.0)
      }
      .accessibilityHidden(true)
      Spacer()
    }
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
