//
//  DoubleTap.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct DoubleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiTapView(taps: [.init(), .init()])
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiTapView)?.start()
  }
}

struct TripleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = MultiTapView(taps: [.init(), .init(), .init()])
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? MultiTapView)?.start()
  }
}

final class MultiTapView: UIView {
  private let taps: [SingleTapView]

  init(taps: [SingleTapView]) {
    self.taps = taps
    super.init(frame: .zero)
    setup()
  }

  required init?(coder: NSCoder) { fatalError() }

  func start() {
    taps.enumerated().forEach { index, tap in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 * Double(index)) {
        tap.reset()
      }
    }
  }
}

private extension MultiTapView {
  func setup() {
    setupHierarchy()
    setupConstraints()
    setupAccessibility()
  }

  func setupHierarchy() {
    taps.forEach {
      addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
  }

  func setupConstraints() {
    taps.forEach {
      NSLayoutConstraint.activate([
        $0.centerXAnchor.constraint(equalTo: centerXAnchor),
        $0.centerYAnchor.constraint(equalTo: centerYAnchor)
      ])
    }
  }

  func setupAccessibility() {
    isAccessibilityElement = true
    subviews.forEach { $0.isAccessibilityElement = false }
    accessibilityLabel = {
      switch taps.count {
      case 1:
        return L10n.Gesture.accessible(L10n.Gesture.singleTap)
      case 2:
        return L10n.Gesture.accessible(L10n.Gesture.doubleTap)
      case 3:
        return L10n.Gesture.accessible(L10n.Gesture.tripleTap)
      default:
        return .empty
      }
    }()
  }
}
