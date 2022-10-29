//
//  UIContentSize.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 05/10/22.
//

import SwiftUI

struct UIContentSizePage: View, Page {
  let title: String = L10n.UIContentSizeCategory.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        intro
        list
        items
        Divider()
        code
        link
      }
      .toAny()
    }
  }
}

private extension UIContentSizePage {
  var intro: some View {
    Group {
      Text(L10n.UIContentSizeCategory.Intro.text1)
      Text(L10n.UIContentSizeCategory.Intro.text2)
      Comment(L10n.UIContentSizeCategory.Intro.comment1)
    }
  }

  var list: some View {
    Group {
      Title(L10n.UIContentSizeCategory.List.title)
      Text(L10n.UIContentSizeCategory.List.text1)
      InternalLink(page: IdentifyCurrentPreferredFontSizePage().page, title: L10n.IdentifyCurrentPreferredFontSizePage.title)
      Comment(L10n.UIContentSizeCategory.List.comment1)
      InternalLink(page: ScallingFontsAutomaticallyPage().page, title: L10n.ImplementingDynamicFonts.title)
      VerticalSpace(.regular)
    }
  }

  var items: some View {
    ForEach(UIContentSizeCategory.allCases, id: \.title) { category in
      Title(category.title.capitalized)
      let current = category == UIApplication.shared.preferredContentSizeCategory
      if current { currentMarker }
      ScrollView([.horizontal], showsIndicators: true) {
        HStack(spacing: .large) {
          ForEach(SystemFontType.allCases, id: \.rawValue) { type in
            item(category: category, type: type)
          }
        }
        VerticalSpace(.regular)
      }
    }
  }

  var currentMarker: some View {
    Text(L10n.UIContentSizeCategory.List.current)
      .multilineTextAlignment(.center)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.accentColor.opacity(0.3))
      }
      .fixedSize(horizontal: false, vertical: true)
  }

  @ViewBuilder
  func item(category: UIContentSizeCategory, type item: SystemFontType) -> some View {
    let fontSize = category.sizes[item] ?? .zero
    let current = category == UIApplication.shared.preferredContentSizeCategory
    VStack(alignment: .center, spacing: .small) {
      Text("Aa")
        .font(.system(size: fontSize))
      VerticalSpace(.regular)
      Text(item.name)
      Comment(L10n.fontSize("\(fontSize)"))
    }
    .frame(minWidth: 100.0)
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(current ? .accentColor.opacity(0.3) : .secondaryBackground)
    }
    .accessibilityElement(children: .ignore)
    .accessibilityLabel([category.title, item.name, L10n.fontSize("\(fontSize)")].joined(separator: .commaSpace))
  }

  var code: some View {
    Group {
      Text(L10n.UIContentSizeCategory.Code.text1)
      Code.uikit(
        """
        UIFont.preferredFont(forTextStyle: .body).pointSize
        """
      )
    }
  }

  var link: some View {
    DocButton(link: "https://developer.apple.com/documentation/uikit/uicontentsizecategory", title: title)
  }
}
