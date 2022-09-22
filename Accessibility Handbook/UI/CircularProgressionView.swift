//
//  CircularProgressionView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct CircularProgressView: View {
  @Binding var progress: Double

  var body: some View {
    ZStack {
      Circle()
      .stroke(
        Color.secondaryBackground.opacity(0.5),
        lineWidth: 15
      )
      Circle()
      .trim(from: 0, to: progress)
      .stroke(
        Color.accentColor,
        style: StrokeStyle(
          lineWidth: 15,
          lineCap: .round
        )
      )
      .rotationEffect(.degrees(-90))
    }
  }
}
