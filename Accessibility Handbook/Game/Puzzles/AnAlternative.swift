//
//  AnAlternative.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 10/10/22.
//

import SwiftUI

struct AnAlternative: GamePage, View {
  let title: String = L10n.AnAlternative.title
  var completed: Bool { GameStates.anAlternativeCompleted }

  let hintPage: AnyView = WhatIsDarkModePage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @Environment(\.colorScheme) var colorScheme

  @State private var on1: Bool = false
  @State private var on2: Bool = false
  @State private var on3: Bool = false
  @State private var on4: Bool = false
  @State private var on5: Bool = false
  @State private var on6: Bool = false

  var hasSucceeded: Bool {
    on1 && on2 && on3 && on4 && on5 && on6
  }

  var ordered: [Bool] {
    [on1, on2, on3, on4, on5, on6]
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.AnAlternative.text)
        VerticalSpace(.large)
        switch colorScheme {
        case .dark:
          darkMode
        case .light:
          lightMode
        @unknown default:
          lightMode
        }
      }
      .toAny()
    } link: {
      hintPage
    }
    .onChange(of: hasSucceeded) { newValue in
      success = newValue
      guard success else { return }
      GameStates.anAlternativeCompleted = true
    }
    .onChange(of: ordered) { newValue in
      guard !isValidOrder(newValue) else { return }
      haptic(.error)
      reset()
    }
  }
}

private extension AnAlternative {
  var lightMode: some View {
    VStack(alignment: .center, spacing: .large) {
      Toggle("2", isOn: $on2)
      Toggle("4", isOn: $on4)
      Toggle("5", isOn: $on5)
    }
    .padding()
  }

  var darkMode: some View {
    VStack(alignment: .center, spacing: .large) {
      Toggle("1", isOn: $on1)
      Toggle("3", isOn: $on3)
      Toggle("6", isOn: $on6)
    }
    .padding()
  }

  func isValidOrder(_ array: [Bool]) -> Bool {
    guard !array.isEmpty else { return true }
    guard
      let firstTrueIndex = array.firstIndex(of: true)
    else { return true }
    if firstTrueIndex == 0 {
      return isValidOrder(Array(array.dropFirst()))
    } else {
      return false
    }
  }

  func reset() {
    on1 = false
    on2 = false
    on3 = false
    on4 = false
    on5 = false
    on6 = false
  }
}
