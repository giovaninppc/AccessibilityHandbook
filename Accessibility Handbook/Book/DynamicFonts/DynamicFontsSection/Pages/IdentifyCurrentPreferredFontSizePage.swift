//
//  IdentifyCurrentPreferredFontSizePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 03/10/22.
//

import SwiftUI

struct IdentifyCurrentPreferredFontSizePage: View, Page {
  let title: String = L10n.IdentifyCurrentPreferredFontSizePage.title

  @State private var size: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory
  @State private var type: SystemFontType = .body

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        variations
        example
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

  var example: some View {
    Group {
      Centered {
        VStack(spacing: .regular) {
          Text("Aa")
            .font(.system(size: size.sizes[type] ?? .zero).bold())
            .accessibilityHidden(true)
          Comment(L10n.fontSize("\(size.sizes[type] ?? .zero)"))
            .fixedSize(horizontal: false, vertical: true)

          Picker("Selected content size", selection: $size) {
            ForEach(UIContentSizeCategory.allCases, id: \.title) { category in
              Text(category.title).tag(category)
                .font(.callout.bold())
            }
          }

          Picker("Selected font type", selection: $type) {
            ForEach(SystemFontType.allCases, id: \.rawValue) { type in
              Text(type.rawValue).tag(type)
                .font(.callout.bold())
            }
          }
        }
        .toAny()
      }
    }
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
  }

  var doc: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uicontentsizecategory", title: "UIContentSizeCategory")
  }
}
