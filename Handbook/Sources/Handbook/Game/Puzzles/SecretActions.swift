//
//  SecretActions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct SecretActions: GamePage, View {
  let title: String = L10n.SecretActions.title
  var completed: Bool { GameStates.secretActionsCompleted }

  let hintPage: AnyView = CustomActionsPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var fishFeeded: Bool = false
  @State private var tortoiseFeeded: Bool = false
  @State private var hareFeeded: Bool = false
  @State private var birdFeeded: Bool = false

  var hasFinished: Bool {
    fishFeeded && tortoiseFeeded && hareFeeded && birdFeeded
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text(L10n.SecretActions.text)
        Comment(L10n.SecretActions.comment)
        VerticalSpace(.large)
        Centered {
          HStack(spacing: .large) {
            item(icon: Asset.fish.image, feeded: fishFeeded, food: .bubbles) { fishFeeded = true }
            item(icon: Asset.tortoise.image, feeded: tortoiseFeeded, food: .apple) { tortoiseFeeded = true }
            item(icon: Asset.hare.image, feeded: hareFeeded, food: .grass) { hareFeeded = true }
            item(icon: Asset.bird.image, feeded: birdFeeded, food: .nectar) { birdFeeded = true }
          }.toAny()
        }
      }
      .toAny()
    } link: {
      hintPage
    }
    .onChange(of: hasFinished) { newValue in
      guard newValue else { return }
      success = true
      GameStates.secretActionsCompleted = true
    }
  }

  @ViewBuilder
  private func item(icon: UIImage, feeded: Bool, food: Food, onSuccess: @escaping () -> Void) -> some View {
    Image(uiImage: icon)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 50.0, height: 50.0)
      .foregroundColor(feeded ? .pink : .white)
      .accessibilityAction(named: Text(L10n.SecretActions.Action.apples)) {
        if food == .apple {
          haptic(.success)
          onSuccess()
        } else {
          haptic(.error)
        }
      }
      .accessibilityAction(named: Text(L10n.SecretActions.Action.grass)) {
        if food == .grass {
          haptic(.success)
          onSuccess()
        } else {
          haptic(.error)
        }
      }
      .accessibilityAction(named: Text(L10n.SecretActions.Action.bubbles)) {
        if food == .bubbles {
          haptic(.success)
          onSuccess()
        } else {
          haptic(.error)
        }
      }
      .accessibilityAction(named: Text(L10n.SecretActions.Action.nectar)) {
        if food == .nectar {
          haptic(.success)
          onSuccess()
        } else {
          haptic(.error)
        }
      }
  }

  enum Food {
    case apple
    case grass
    case bubbles
    case nectar
  }
}
