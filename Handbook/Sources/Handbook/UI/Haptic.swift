//
//  Haptic.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

extension View {
  func haptic(_ haptic: Haptic.HapticType) {
    Haptic(type: haptic).fire()
  }

  func selection() {
    Haptic(type: .selection).fire()
  }
}

public final class Haptic {
  public enum HapticType {
    // Notification
    case success
    case error
    case warning

    // Impact
    case lightImpact
    case mediumImpact
    case heavyImpact

    // Selection
    case selection

    @available(iOS 10.0, *)
    var generator: UIFeedbackGenerator {
      switch self {
      case .success, .error, .warning: return UINotificationFeedbackGenerator()
      case .lightImpact: return UIImpactFeedbackGenerator(style: .light)
      case .mediumImpact: return UIImpactFeedbackGenerator(style: .medium)
      case .heavyImpact: return UIImpactFeedbackGenerator(style: .heavy)
      case .selection: return UISelectionFeedbackGenerator()
      }
    }

    @available(iOS 10.0, *)
    var notificationType: UINotificationFeedbackGenerator.FeedbackType {
      switch self {
      case .success: return .success
      case .error: return .error
      case .warning: return .warning
      default: return .error
      }
    }
  }

  private var multipleUse: Bool
  private var type: HapticType
  private var feedbackGenerator: Any?

  public init(type: Haptic.HapticType, multipleUse: Bool = false) {
    self.type = type
    self.multipleUse = multipleUse

    let feedback = type.generator
    feedback.prepare()
    feedbackGenerator = feedback
  }

  public func fire() {
  guard let feedback = feedbackGenerator as? UIFeedbackGenerator else { return }
  switch type {
  case .success, .error, .warning:
    guard let generator = feedback as? UINotificationFeedbackGenerator else { return }
    generator.notificationOccurred(type.notificationType)

  case .lightImpact, .mediumImpact, .heavyImpact:
    guard let generator = feedback as? UIImpactFeedbackGenerator else { return }
    generator.impactOccurred()

  case .selection:
    guard let generator = feedback as? UISelectionFeedbackGenerator else { return }
    generator.selectionChanged()
  }

  if multipleUse { feedback.prepare() }
  }
}
