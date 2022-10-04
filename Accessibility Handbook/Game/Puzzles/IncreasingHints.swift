//
//  IncreasingHints.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 04/10/22.
//

import SwiftUI

struct IncreasingHints: View, GamePage {
  let title: String = L10n.IncreasingHints.title
  let hintPage: AnyView = ScallingFontsAutomaticallyPage().page
  var completed: Bool { GameStates.increasingHintsCompleted }

  @State var success: Bool = false
  @State var hinting: Bool = false
  @State var word: String = ""
  @State var currentSizeCategory = UIApplication.shared.preferredContentSizeCategory
  @FocusState private var fieldIsFocused: Bool

  private var hasFiguredPassword: Bool {
    word == "131644"
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.IncreasingHints.text)
        VerticalSpace(.large)
        hints
        VerticalSpace(.large)
        TextField(L10n.password, text: $word)
          .keyboardType(.numberPad)
          .focused($fieldIsFocused)
          .padding()
          .background(Color.secondaryBackground)
      }
      .toAny()
    } link: {
      hintPage
    }
    .onChange(of: hasFiguredPassword) { newValue in
      success = hasFiguredPassword
      guard hasFiguredPassword else { return }
      GameStates.increasingHintsCompleted = true
    }
    .onTapGesture {
      fieldIsFocused = false
    }
    .onAppear {
      NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: nil, queue: nil) { _ in
        currentSizeCategory = UIApplication.shared.preferredContentSizeCategory
      }
    }
  }
}

private extension IncreasingHints {
  var hints: some View {
    Text(currentHint(for: currentSizeCategory))
      .font(.title3.bold())
  }

  func currentHint(for category: UIContentSizeCategory) -> String {
    switch category {
    case .extraSmall:
      return L10n.IncreasingHints.hint1
    case .small, .medium, .large:
      return L10n.IncreasingHints.hint2
    case .extraLarge:
      return L10n.IncreasingHints.hint3
    case .extraExtraLarge, .extraExtraExtraLarge:
      return L10n.IncreasingHints.hint4
    case .accessibilityMedium:
      return L10n.IncreasingHints.hint5
    case .accessibilityLarge:
      return L10n.IncreasingHints.hint6
    case .accessibilityExtraLarge:
      return L10n.IncreasingHints.hint7
    case .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge:
      return L10n.IncreasingHints.hint8
    default:
      return L10n.IncreasingHints.unspecified
    }
  }
}
