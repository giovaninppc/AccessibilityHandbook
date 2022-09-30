//
//  TwoFingerSwipe.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct TwoFingerSwipeUp: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiSwipeVerticalView(swipes: [
      .init(direction: .up), .init(direction: .up)
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.twoFingersSwipeUp)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiSwipeVerticalView)?.start()
  }
}

struct TwoFingerSwipeDown: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiSwipeVerticalView(swipes: [
      .init(direction: .down), .init(direction: .down)
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.twoFingersSwipeDown)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiSwipeVerticalView)?.start()
  }
}

struct ThreeFingerSwipeUp: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiSwipeVerticalView(swipes: [
      .init(direction: .up), .init(direction: .up), .init(direction: .up)
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.threeFingersSwipeUp)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiSwipeVerticalView)?.start()
  }
}

struct ThreeFingerSwipeDown: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiSwipeVerticalView(swipes: [
      .init(direction: .down), .init(direction: .down), .init(direction: .down)
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.threeFingersSwipeDown)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiSwipeVerticalView)?.start()
  }
}

final private class MultiSwipeVerticalView: UIView {
  let swipes: [VerticalSwipe]

  init(swipes: [VerticalSwipe]) {
    self.swipes = swipes
    super.init(frame: .zero)
    setup()
  }

  required init?(coder: NSCoder) { fatalError() }

  func start() {
    swipes.forEach { $0.reset() }
  }
}

private extension MultiSwipeVerticalView {
  func setup() {
    setupHierarchy()
    setupConstraints()
    setupAccessibility()
  }

  func setupHierarchy() {
    swipes.forEach { addSubview($0) }
  }

  func setupConstraints() {
    var allSpace = -15 * (swipes.count - 1)
    swipes.forEach { swipe in
      swipe.translatesAutoresizingMaskIntoConstraints = false
      let offsetConstant: CGFloat = CGFloat(allSpace)
      allSpace += 30
      NSLayoutConstraint.activate([
        swipe.topAnchor.constraint(equalTo: topAnchor),
        swipe.bottomAnchor.constraint(equalTo: bottomAnchor),
        swipe.centerXAnchor.constraint(equalTo: centerXAnchor, constant: offsetConstant)
      ])
    }
  }

  func setupAccessibility() {
    isAccessibilityElement = true
    subviews.forEach { $0.isAccessibilityElement = false }
  }
}
