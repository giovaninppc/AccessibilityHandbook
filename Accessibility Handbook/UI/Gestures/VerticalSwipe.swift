//
//  VerticalSwipe.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

// - SwiftUI interface

struct SwipeUp: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = VerticalSwipe(direction: .up)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? VerticalSwipe)?.start()
  }
}

struct SwipeDown: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = VerticalSwipe(direction: .down)
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? VerticalSwipe)?.start()
  }
}

// - UIKit animation

final private class VerticalSwipe: UIView {
  enum Direction: CGFloat {
    case up = 1
    case down = -1
  }

  private enum Constants {
    static let initialOffset: CGFloat = 50
    static let finalOffset: CGFloat = -50
    static let initialSize: CGFloat = 30.0
    static let finalSize: CGFloat = 20.0
  }

  private let gesture: UIView = {
    let view = UIView()
    view.backgroundColor = .label
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let track: UIView = {
    let view = UIView()
    view.backgroundColor = .label
    view.translatesAutoresizingMaskIntoConstraints = false
    view.alpha = 0.0
    return view
  }()

  // MARK: - Animatable
  private let direction: Direction
  private var widthConstraint: NSLayoutConstraint?
  private var centerOffsetConstraint: NSLayoutConstraint?
  private var trackWidthConstraint: NSLayoutConstraint?

  init(direction: Direction) {
    self.direction = direction
    super.init(frame: .zero)
    setup()
  }

  required init?(coder: NSCoder) { fatalError() }

  func start() {
    reset()
  }
}

// MARK: - Setup

private extension VerticalSwipe {
  func setup() {
    setupHierarchy()
    setupConstraints()
    setupAccessibility()
  }

  func setupHierarchy() {
    addSubview(track)
    addSubview(gesture)
  }

  func setupConstraints() {
    constrainGesture()
    constrainTracking()
  }

  func setupAccessibility() {
    isAccessibilityElement = true
    subviews.forEach { $0.isAccessibilityElement = false }
    accessibilityLabel = L10n.Gesture.accessible(direction == .up ? L10n.Gesture.swipeUp : L10n.Gesture.swipeDown)
  }

  private func constrainGesture() {
    widthConstraint = gesture.widthAnchor.constraint(equalToConstant: .zero)
    centerOffsetConstraint = gesture.centerYAnchor.constraint(
      equalTo: centerYAnchor,
      constant: Constants.initialOffset
    )

    NSLayoutConstraint.activate([
      widthConstraint,
      centerOffsetConstraint,
      gesture.centerXAnchor.constraint(equalTo: centerXAnchor),
      gesture.heightAnchor.constraint(equalTo: gesture.widthAnchor)
    ].compactMap { $0 })
  }

  private func constrainTracking() {
    trackWidthConstraint = track.widthAnchor.constraint(equalToConstant: Constants.initialSize)

    NSLayoutConstraint.activate([
      trackWidthConstraint,
      direction == .up
        ? track.topAnchor.constraint(equalTo: gesture.centerYAnchor)
        : track.bottomAnchor.constraint(equalTo: gesture.centerYAnchor),
      direction == .up
        ? track.bottomAnchor.constraint(equalTo: centerYAnchor, constant: Constants.initialOffset)
        : track.topAnchor.constraint(equalTo: centerYAnchor, constant: -Constants.initialOffset),
      track.centerXAnchor.constraint(equalTo: centerXAnchor)
    ].compactMap { $0 })
  }
}

// MARK: - Animation

private extension VerticalSwipe {
  func popUp() {
    UIView.animate(withDuration: 0.2, delay: 0.5, options: [.curveEaseIn]) {
      self.widthConstraint?.constant = Constants.initialSize
      self.gesture.layer.cornerRadius = Constants.initialSize / 2.0
      self.track.layer.cornerRadius = Constants.initialSize / 2.0
      self.track.alpha = 0.6
      self.layoutIfNeeded()
    } completion: { _ in
      self.slide()
    }
  }

  func slide() {
    UIView.animate(withDuration: 1.0, delay: .zero, options: [.curveEaseInOut]) {
      self.centerOffsetConstraint?.constant = self.direction.rawValue * Constants.finalOffset

      self.trackWidthConstraint?.constant = Constants.finalSize
      self.widthConstraint?.constant = Constants.finalSize

      self.gesture.layer.cornerRadius = Constants.finalSize / 2.0
      self.track.layer.cornerRadius = Constants.finalSize / 2.0

      self.gesture.alpha = 0.8
      self.track.alpha = 0.05

      self.layoutIfNeeded()
    } completion: { _ in
      self.reset()
    }
  }

  func reset() {
    UIView.animate(withDuration: 0.2, delay: .zero, options: [.curveEaseOut]) {
      self.widthConstraint?.constant = .zero
      self.gesture.layer.cornerRadius = .zero
      self.track.alpha = .zero

      self.layoutIfNeeded()
    } completion: { _ in
      self.trackWidthConstraint?.constant = Constants.initialSize
      self.centerOffsetConstraint?.constant = self.direction.rawValue * Constants.initialOffset
      self.gesture.alpha = 1.0
      self.layoutIfNeeded()
      self.popUp()
    }
  }
}
