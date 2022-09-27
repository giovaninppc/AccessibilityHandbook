//
//  Tap.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 27/09/22.
//

import SwiftUI

struct SingleTap: UIViewRepresentable {
  func makeUIView(context: Context) -> UIView {
    let animation = SingleTapView()
    return animation
  }

  func updateUIView(_ animation: UIView, context: Context) {
    (animation as? SingleTapView)?.start()
  }
}

final class SingleTapView: UIView {
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

  private var widthConstraint: NSLayoutConstraint?

  init() {
    super.init(frame: .zero)
    setup()
  }

  required init?(coder: NSCoder) { fatalError() }

  func start() {
    reset()
  }
}

private extension SingleTapView {
  func setup() {
    setupHierarchy()
    setupConstraints()
    setupAccessibility()
  }

  func setupHierarchy() {
    addSubview(gesture)
  }

  func setupConstraints() {
    widthConstraint = gesture.widthAnchor.constraint(equalToConstant: .zero)

    NSLayoutConstraint.activate([
      widthConstraint,
      gesture.heightAnchor.constraint(equalTo: gesture.widthAnchor),
      gesture.centerXAnchor.constraint(equalTo: centerXAnchor),
      gesture.centerYAnchor.constraint(equalTo: centerYAnchor)
    ].compactMap { $0 })
  }

  func setupAccessibility() {
    isAccessibilityElement = true
    subviews.forEach { $0.isAccessibilityElement = false }
    accessibilityLabel = L10n.Gesture.accessible(L10n.Gesture.singleTap)
  }
}

extension SingleTapView {
  func popIn() {
    UIView.animate(withDuration: 0.5, delay: 0.7, options: [.curveEaseIn]) {
      self.gesture.alpha = 1.0
      self.widthConstraint?.constant = 30.0
      self.gesture.layer.cornerRadius = 15.0
      self.layoutIfNeeded()
    } completion: { _ in
      self.reset()
    }
  }

  func reset() {
    UIView.animate(withDuration: 0.3, delay: .zero, options: [.curveEaseOut]) {
      self.gesture.alpha = 0.0
      self.widthConstraint?.constant = 40.0
      self.gesture.layer.cornerRadius = 20.0
      self.layoutIfNeeded()
    } completion: { _ in
      self.widthConstraint?.constant = 0.0
      self.gesture.layer.cornerRadius = 0.0
      self.layoutIfNeeded()
      self.popIn()
    }

  }
}
