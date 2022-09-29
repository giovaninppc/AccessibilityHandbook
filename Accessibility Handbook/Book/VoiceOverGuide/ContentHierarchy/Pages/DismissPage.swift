//
//  DismissPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/09/22.
//

import SwiftUI

struct DismissPage: View, Page {
  let title: String = L10n.DismissPage.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        intro
        handling
      }
      .toAny()
    }
  }
}

private extension DismissPage {
  var intro: some View {
    Group {
      Text(L10n.DismissPage.text1)
      VerticalSpace(.regular)
      DismissGesture()
        .frame(width: nil, height: 100.0)
      VerticalSpace(.regular)
      Comment(L10n.DismissPage.comment1)
      InternalLink(page: GesturesPage().page, title: L10n.Navigation.gesturesLink)
    }
  }

  var handling: some View {
    Group {
      Text(L10n.DismissPage.Handle.text1)
      Code.uikit(
        """
        override func accessibilityPerformEscape() -> Bool {
          // Handle escape
          // Returns true if the content was dismissed
          return true
        }
        """
      )
      Text(L10n.DismissPage.Handle.text2)
      Code.swiftUI(
        """
        View()
        .accessibilityAction(.escape) {
          // Handle escape
        }
        """
      )
      DocButton(link: "https://developer.apple.com/documentation/objectivec/nsobject/1615091-accessibilityperformescape", title: title)
    }
  }
}
