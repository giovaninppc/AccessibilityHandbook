//
//  FillTheCup.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct FillTheCup: GamePage, View {
  var title: String = "Fill the Cup"
  var completed: Bool { GameStates.fillTheCupCompleted }

  let hintPage: AnyView = AdjustablePage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var progress1: Double = 0.1
  @State private var progress2: Double = 0.2
  @State private var progress3: Double = 0.3

  var hasFinished: Bool {
    progress1 >= 1.0 && progress2 >= 1.0 && progress3 >= 1.0
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text("Fill the circles all the way up!")
        Comment("You just need to find a way to do it")
        VerticalSpace(.large)

        item(progress: $progress1)
        VerticalSpace(.regular)
        item(progress: $progress2)
        VerticalSpace(.regular)
        item(progress: $progress3)
      }
      .toAny()
    } link: {
      hintPage
    }
    .onChange(of: hasFinished) { newValue in
      success = newValue
      guard success else { return }
      GameStates.fillTheCupCompleted = true
    }
  }

  @ViewBuilder
  private func item(progress: Binding<Double>) -> some View {
    Centered {
      CircularProgressView(progress: progress)
        .frame(width: 100, height: 100, alignment: .center)
        .accessibilityValue("\(Int(progress.wrappedValue * 100.0))%")
        .accessibilityAdjustableAction { direction in
          switch direction {
          case .increment:
            progress.wrappedValue += 0.1
            progress.wrappedValue = progress.wrappedValue > 1.0 ? 1.0 : progress.wrappedValue
          case .decrement:
            progress.wrappedValue -= 0.1
            progress.wrappedValue = progress.wrappedValue < 0.0 ? 0.0 : progress.wrappedValue
          @unknown default:
            break
          }
        }
        .toAny()
    }
  }
}
