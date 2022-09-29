//
//  DismissGesture.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/09/22.
//

import SwiftUI

struct DismissGesture: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = DismissGestureView()
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? DismissGestureView)?.start()
  }
}

// - UIKit animation

final private class DismissGestureView: UIView {
  private enum Constants {
    static let initialOffset: CGFloat = -50
    static let finalOffset: CGFloat = 50
    static let initialSize: CGFloat = 30.0
    static let spacing: CGFloat = 33.0
  }

  private let gesture: UIView = {
    let view = UIView()
    view.backgroundColor = .label
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  private let secondFinger: UIView = {
    let view = UIView()
    view.backgroundColor = .label
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  // MARK: - Animatable
  private var widthConstraint: NSLayoutConstraint?
  private var secondWidthConstraint: NSLayoutConstraint?
  private var horizontalOffset: NSLayoutConstraint?
  private var secondHorizontalOffset: NSLayoutConstraint?
  private var verticalOffset: NSLayoutConstraint?
  private var secondVerticalOffset: NSLayoutConstraint?

  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder: NSCoder) { fatalError() }

  func start() {
    reset()
  }
}

// MARK: - Setup

private extension DismissGestureView {
  func setup() {
    setupHierarchy()
    setupConstraints()
    setupAccessibility()
  }

  func setupHierarchy() {
    addSubview(gesture)
    addSubview(secondFinger)
  }

  func setupConstraints() {
    constrainGesture()
    constrainSecondFinger()
  }

  func setupAccessibility() {
    isAccessibilityElement = true
    subviews.forEach { $0.isAccessibilityElement = false }
    accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.dismiss)
  }

  private func constrainGesture() {
    widthConstraint = gesture.widthAnchor.constraint(equalToConstant: .zero)
    horizontalOffset = gesture.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Constants.initialOffset)
    verticalOffset = gesture.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.initialOffset)

    NSLayoutConstraint.activate([
      widthConstraint,
      horizontalOffset,
      verticalOffset,
      gesture.heightAnchor.constraint(equalTo: gesture.widthAnchor)
    ].compactMap { $0 })
  }

  private func constrainSecondFinger() {
    secondWidthConstraint = secondFinger.widthAnchor.constraint(equalToConstant: .zero)
    secondHorizontalOffset = secondFinger.centerXAnchor.constraint(equalTo: centerXAnchor, constant: Constants.initialOffset)
    secondVerticalOffset = secondFinger.centerYAnchor.constraint(equalTo: centerYAnchor, constant: Constants.initialOffset)

    NSLayoutConstraint.activate([
      secondWidthConstraint,
      secondVerticalOffset,
      secondHorizontalOffset,
      secondFinger.heightAnchor.constraint(equalTo: secondFinger.widthAnchor),
    ].compactMap { $0 })
  }
}

// MARK: - Animation

private extension DismissGestureView {
  func popUp() {
    UIView.animate(withDuration: 0.2, delay: 0.5, options: [.curveEaseIn]) {
      self.widthConstraint?.constant = Constants.initialSize
      self.gesture.layer.cornerRadius = Constants.initialSize / 2.0

      self.secondWidthConstraint?.constant = Constants.initialSize
      self.secondFinger.layer.cornerRadius = Constants.initialSize / 2.0

      self.layoutIfNeeded()
    } completion: { _ in
      self.slideRight()
    }
  }

  func slideRight() {
    UIView.animate(withDuration: 0.7, delay: .zero, options: [.curveEaseInOut]) {
      self.gesture.layer.cornerRadius = 13.0
      self.horizontalOffset?.constant = Constants.finalOffset
      self.widthConstraint?.constant = 26.0
      self.gesture.alpha = 0.9

      self.secondFinger.layer.cornerRadius = 13.0
      self.secondHorizontalOffset?.constant = Constants.finalOffset + Constants.spacing
      self.secondWidthConstraint?.constant = 26.0
      self.secondFinger.alpha = 0.9

      self.layoutIfNeeded()
    } completion: { _ in
      self.slideDown()
    }
  }

  func slideDown() {
    UIView.animate(withDuration: 0.7, delay: .zero, options: [.curveEaseInOut]) {
      self.horizontalOffset?.constant = Constants.initialOffset
      self.verticalOffset?.constant = Constants.finalOffset
      self.widthConstraint?.constant = 24.0
      self.gesture.layer.cornerRadius = 12.0
      self.gesture.alpha = 0.8

      self.secondHorizontalOffset?.constant = Constants.initialOffset + Constants.spacing
      self.secondVerticalOffset?.constant = Constants.finalOffset
      self.secondWidthConstraint?.constant = 24.0
      self.secondFinger.layer.cornerRadius = 12.0
      self.secondFinger.alpha = 0.8

      self.layoutIfNeeded()
    } completion: { _ in
      self.slideRightAgain()
    }
  }

  func slideRightAgain() {
    UIView.animate(withDuration: 0.7, delay: .zero, options: [.curveEaseInOut]) {
      self.horizontalOffset?.constant = Constants.finalOffset
      self.widthConstraint?.constant = 20.0
      self.gesture.layer.cornerRadius = 10.0

      self.secondHorizontalOffset?.constant = Constants.finalOffset + Constants.spacing
      self.secondWidthConstraint?.constant = 20.0
      self.secondFinger.layer.cornerRadius = 10.0

      self.layoutIfNeeded()
    } completion: { _ in
      self.reset()
    }
  }

  func reset() {
    UIView.animate(withDuration: 0.2, delay: .zero, options: [.curveEaseOut]) {
      self.widthConstraint?.constant = .zero
      self.gesture.layer.cornerRadius = .zero

      self.secondWidthConstraint?.constant = .zero
      self.secondFinger.layer.cornerRadius = .zero

      self.layoutIfNeeded()
    } completion: { _ in
      self.horizontalOffset?.constant = Constants.initialOffset
      self.verticalOffset?.constant = Constants.initialOffset
      self.gesture.alpha = 1.0

      self.secondHorizontalOffset?.constant = Constants.initialOffset + Constants.spacing
      self.secondVerticalOffset?.constant = Constants.initialOffset
      self.secondFinger.alpha = 1.0
      self.layoutIfNeeded()
      self.popUp()
    }
  }
}
