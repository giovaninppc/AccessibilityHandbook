//
//  MultiFingerTap.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct TwoFingerSingleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiFingerTapView(taps: [
      .init(taps: [.init()]), .init(taps: [.init()])
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.twoFingersSingleTap)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiFingerTapView)?.start()
  }
}

struct TwoFingerDoubleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiFingerTapView(taps: [
      .init(taps: [.init(), .init()]), .init(taps: [.init(), .init()])
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.twoFingersDoubleTap)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiFingerTapView)?.start()
  }
}

struct ThreeFingerSingleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiFingerTapView(taps: [
      .init(taps: [.init()]), .init(taps: [.init()]), .init(taps: [.init()])
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.threeFingersSingleTap)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiFingerTapView)?.start()
  }
}

struct ThreeFingerDoubleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiFingerTapView(taps: [
      .init(taps: [.init(), .init()]), .init(taps: [.init(), .init()]), .init(taps: [.init(), .init()])
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.threeFingersDoubleTap)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiFingerTapView)?.start()
  }
}

struct ThreeFingerTripleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiFingerTapView(taps: [
      .init(taps: [.init(), .init(), .init()]), .init(taps: [.init(), .init(), .init()]), .init(taps: [.init(), .init(), .init()])
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.threeFingersTripleTap)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiFingerTapView)?.start()
  }
}

struct FourFingerDoubleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiFingerTapView(taps: [
      .init(taps: [.init(), .init()]), .init(taps: [.init(), .init()]), .init(taps: [.init(), .init()]), .init(taps: [.init(), .init()])
    ])
    animation.accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.fourFingersDoubleTap)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiFingerTapView)?.start()
  }
}

final private class MultiFingerTapView: UIView {
  let taps: [MultiTapView]

  init(taps: [MultiTapView]) {
    self.taps = taps
    super.init(frame: .zero)
    setup()
  }

  required init?(coder: NSCoder) { fatalError() }

  func start() {
    taps.forEach { $0.start() }
  }
}

private extension MultiFingerTapView {
  func setup() {
    setupHierarchy()
    setupConstraints()
    setupAccessibility()
  }

  func setupHierarchy() {
    taps.forEach { addSubview($0) }
  }

  func setupConstraints() {
    var allSpace = -15 * (taps.count - 1)
    taps.forEach { swipe in
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
