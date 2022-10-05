//
//  UIContentSizeCategory+Extensions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 05/10/22.
//

import UIKit

extension UIContentSizeCategory: CaseIterable {
  public static var allCases: [UIContentSizeCategory] {
    [
      .extraSmall, .small, .medium, .large, .extraLarge, .extraExtraLarge, .extraExtraExtraLarge,
      .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge
    ]
  }

  var title: String {
    switch self {
    case .extraSmall:
      return "extra small"
    case .small:
      return "small"
    case .medium:
      return "medium"
    case .large:
      return "large"
    case .extraLarge:
      return "extra large"
    case .extraExtraLarge:
      return "extra extra large"
    case .extraExtraExtraLarge:
      return "extra extra extra large"
    case .accessibilityMedium:
      return "accessibility medium"
    case .accessibilityLarge:
      return "accessibility large"
    case .accessibilityExtraLarge:
      return "accessibility extra large"
    case .accessibilityExtraExtraLarge:
      return "accessibility extra extra large"
    case .accessibilityExtraExtraExtraLarge:
      return "accessibility extra extra extra large"
    case .unspecified:
      return "unspecified"
    default:
      return .empty
    }
  }

  var sizes: [SystemFontType: CGFloat] {
    switch self {
    case .extraSmall:
      return SystemFontType.all(body: 14.0, title1: 25.0, title2: 19.0, title3: 17.0, largeTitle: 31.0, caption1: 11.0, caption2: 11.0, callout: 13.0, footnote: 12.0, headline: 14.0, subheadline: 12.0)
    case .small:
      return SystemFontType.all(body: 15.0, title1: 26.0, title2: 20.0, title3: 18.0, largeTitle: 32.0, caption1: 11.0, caption2: 11.0, callout: 14.0, footnote: 12.0, headline: 15.0, subheadline: 13.0)
    case .medium:
      return SystemFontType.all(body: 16.0, title1: 27.0, title2: 21.0, title3: 19.0, largeTitle: 33.0, caption1: 11.0, caption2: 11.0, callout: 15.0, footnote: 12.0, headline: 16.0, subheadline: 14.0)
    case .large:
      return SystemFontType.all(body: 17.0, title1: 28.0, title2: 22.0, title3: 20.0, largeTitle: 34.0, caption1: 12.0, caption2: 11.0, callout: 16.0, footnote: 13.0, headline: 17.0, subheadline: 15.0)
    case .extraLarge:
      return SystemFontType.all(body: 19.0, title1: 30.0, title2: 24.0, title3: 22.0, largeTitle: 36.0, caption1: 14.0, caption2: 13.0, callout: 18.0, footnote: 15.0, headline: 19.0, subheadline: 17.0)
    case .extraExtraLarge:
      return SystemFontType.all(body: 21.0, title1: 32.0, title2: 26.0, title3: 24.0, largeTitle: 38.0, caption1: 16.0, caption2: 15.0, callout: 20.0, footnote: 17.0, headline: 21.0, subheadline: 19.0)
    case .extraExtraExtraLarge:
      return SystemFontType.all(body: 23.0, title1: 34.0, title2: 28.0, title3: 26.0, largeTitle: 40.0, caption1: 18.0, caption2: 17.0, callout: 22.0, footnote: 19.0, headline: 23.0, subheadline: 21.0)
    case .accessibilityMedium:
      return SystemFontType.all(body: 28.0, title1: 38.0, title2: 34.0, title3: 31.0, largeTitle: 44.0, caption1: 22.0, caption2: 20.0, callout: 26.0, footnote: 23.0, headline: 28.0, subheadline: 25.0)
    case .accessibilityLarge:
      return SystemFontType.all(body: 33.0, title1: 43.0, title2: 39.0, title3: 37.0, largeTitle: 48.0, caption1: 26.0, caption2: 24.0, callout: 32.0, footnote: 27.0, headline: 33.0, subheadline: 30.0)
    case .accessibilityExtraLarge:
      return SystemFontType.all(body: 40.0, title1: 48.0, title2: 44.0, title3: 43.0, largeTitle: 52.0, caption1: 32.0, caption2: 29.0, callout: 38.0, footnote: 33.0, headline: 40.0, subheadline: 36.0)
    case .accessibilityExtraExtraLarge:
      return SystemFontType.all(body: 47.0, title1: 53.0, title2: 50.0, title3: 49.0, largeTitle: 56.0, caption1: 37.0, caption2: 34.0, callout: 44.0, footnote: 38.0, headline: 47.0, subheadline: 42.0)
    case .accessibilityExtraExtraExtraLarge:
      return SystemFontType.all(body: 53.0, title1: 58.0, title2: 56.0, title3: 55.0, largeTitle: 60.0, caption1: 43.0, caption2: 40.0, callout: 51.0, footnote: 44.0, headline: 53.0, subheadline: 49.0)
    case .unspecified:
      return SystemFontType.all(body: 0, title1: 0, title2: 0, title3: 0, largeTitle: 0, caption1: 0, caption2: 0, callout: 0, footnote: 0, headline: 0, subheadline: 0)
    default:
      return SystemFontType.all(body: 0, title1: 0, title2: 0, title3: 0, largeTitle: 0, caption1: 0, caption2: 0, callout: 0, footnote: 0, headline: 0, subheadline: 0)
    }
  }
}

struct ContentSizeCategoryItem {
  let name: String
  let size: CGFloat
}

enum SystemFontType: String, CaseIterable {
  case body
  case title1
  case title2
  case title3
  case largeTitle
  case caption1
  case caption2
  case callout
  case footnote
  case headline
  case subheadline

  var name: String {
    self.rawValue
  }

  static func all(
    body: CGFloat,
    title1: CGFloat,
    title2: CGFloat,
    title3: CGFloat,
    largeTitle: CGFloat,
    caption1: CGFloat,
    caption2: CGFloat,
    callout: CGFloat,
    footnote: CGFloat,
    headline: CGFloat,
    subheadline: CGFloat
  ) -> [SystemFontType: CGFloat] {
    [
      .body: body,
      .title1: title1,
      .title2: title2,
      .title3: title3,
      .largeTitle: largeTitle,
      .caption1: caption1,
      .caption2: caption2,
      .callout: callout,
      .footnote: footnote,
      .headline: headline,
      .subheadline: subheadline
    ]
  }
}
