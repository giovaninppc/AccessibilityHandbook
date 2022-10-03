//
//  IdentifyCurrentPreferredFontSizePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 03/10/22.
//

import SwiftUI

struct IdentifyCurrentPreferredFontSizePage: View, Page {
  let title: String = L10n.IdentifyCurrentPreferredFontSizePage.title

  @State private var size: ContentSizes = .xs
  @State private var sliderValue: Double = 0.0
  @State private var largerAccessibilitySizes: Bool = false

  var scale: ClosedRange<Double> {
    switch largerAccessibilitySizes {
    case true:
      return 0...12
    case false:
      return 0...6
    }
  }

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        variations
        example
        list
        doc
      }
      .toAny()
    }
  }
}

private extension IdentifyCurrentPreferredFontSizePage {
  var intro: some View {
    Group {
      Text(L10n.IdentifyCurrentPreferredFontSizePage.Intro.text1)
      Text(L10n.IdentifyCurrentPreferredFontSizePage.Intro.text2)
      Text(L10n.IdentifyCurrentPreferredFontSizePage.Intro.text3)
      Code.uikit(
        """
        let preferredContentSize = UIApplication.shared.preferredContentSizeCategory
        switch preferredContentSize {
        case .extraSmall:
          // Handle
        case .small:
          // Handle

        /* ... Other cases ... */

        case .accessibilityExtraExtraLarge:
          // Handle
        case .accessibilityExtraExtraExtraLarge:
          // Handle
        }
        """
      )
    }
  }

  var variations: some View {
    Group {
      Title(L10n.IdentifyCurrentPreferredFontSizePage.Variations.title)
      Text(L10n.IdentifyCurrentPreferredFontSizePage.Variations.text1)
      Text(L10n.IdentifyCurrentPreferredFontSizePage.Variations.text2)
      Text(L10n.IdentifyCurrentPreferredFontSizePage.Variations.text3)
    }
  }

  var list: some View {
    Group {
      Title(L10n.IdentifyCurrentPreferredFontSizePage.List.title)
      ForEach(ContentSizes.allCases, id: \.rawValue) { size in
        Text(size.name)
          .font(.system(size: size.fontSize))
          Divider()
      }
    }
  }

  var example: some View {
    Group {
      Comment(L10n.IdentifyCurrentPreferredFontSizePage.Variations.comment1)
      HStack {
        Spacer()
        Toggle(L10n.IdentifyCurrentPreferredFontSizePage.Example.toggle, isOn: $largerAccessibilitySizes)
      }
      Centered {
        VStack(spacing: .regular) {
          Text("Aa")
            .font(.system(size: size.fontSize).bold())
            .accessibilityHidden(true)
          Comment(size.name)
        }
        .toAny()
      }

      Slider(value: $sliderValue, in: scale) {
        Text("Selected content size")
      } minimumValueLabel: {
        Text(L10n.minimum)
      } maximumValueLabel: {
        Text(L10n.maximum)
      }
    }
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
    .onChange(of: sliderValue) { newValue in
      let rounded = round(newValue)
      size = ContentSizes(rawValue: rounded) ?? .xs
    }
    .onChange(of: largerAccessibilitySizes) { newValue in
      guard !newValue, size.rawValue >= ContentSizes.a_m.rawValue else { return }
      sliderValue = ContentSizes.xxxl.rawValue
      size = .xxxl
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uicontentsizecategory", title: "UIContentSizeCategory")
  }
}

private extension IdentifyCurrentPreferredFontSizePage {
  enum ContentSizes: CGFloat, CaseIterable {
    case xs = 10.0
    case s = 13.0
    case m = 16.0
    case l = 18.0
    case xl = 19.0
    case xxl = 20.0
    case xxxl = 22.0
    case a_m = 30.0
    case a_l = 35.0
    case a_xl = 40.0
    case a_xxl = 45.0
    case a_xxxl = 50.0

    init?(rawValue: CGFloat) {
      switch rawValue {
      case 0..<1:
        self = .xs
      case 1..<2:
        self = .s
      case 2..<3:
        self = .m
      case 3..<4:
        self = .l
      case 4..<5:
        self = .xl
      case 5..<6:
        self = .xxl
      case 6..<7:
        self = .xxxl
      case 7..<8:
        self = .a_m
      case 8..<9:
        self = .a_l
      case 9..<10:
        self = .a_xl
      case 10..<11:
        self = .a_xxl
      default:
        self = .a_xxxl
      }
    }

    var name: String {
      switch self {
      case .xs:
        return "extra small"
      case .s:
        return "small"
      case .m:
        return "medium"
      case .l:
        return "large"
      case .xl:
        return "extra large"
      case .xxl:
        return "extra extra large"
      case .xxxl:
        return "extra extra extra large"
      case .a_m:
        return "accessibility medium"
      case .a_l:
        return "accessibility large"
      case .a_xl:
        return "accessibility extra large"
      case .a_xxl:
        return "accessibility extra extra large"
      case .a_xxxl:
        return "accessibility extra extra extra large"
      }
    }

    var fontSize: CGFloat {
      rawValue
    }
  }
}
