//
//  ChangeCursorPositionPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct ChangeCursorPositionPage: View, Page {
  let title: String = L10n.ChangeCursor.title

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibility/notification/1620176-announcement
  """

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        content
        VerticalSpace(.regular)
        uiKit
        VerticalSpace(.regular)
        swiftUI
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }
}

// MARK: - Content

private extension ChangeCursorPositionPage {
  var content: some View {
    Group {
      Text(L10n.ChangeCursor.Intro.text1)
      Text(L10n.ChangeCursor.Intro.text2)
      Comment(L10n.ChangeCursor.Intro.comment)
    }
  }
}

// MARK: - UIKit

private extension ChangeCursorPositionPage {
  var uiKit: some View {
    Group {
      Title(L10n.uikit)
      Text(L10n.ChangeCursor.Uikit.text1)
      InternalLink(page: NotifyScreenChangesPage().page, title: L10n.ChangeCursor.Uikit.link)
      Text(L10n.ChangeCursor.Uikit.text2)
      Code.uikit(
        """
        UIAccessibility.post(
          .layoutChanged,
          argument: viewToFocus
        )
        """
      )
    }
  }
}

// MARK: - SwiftUI

private extension ChangeCursorPositionPage {
  var swiftUI: some View {
    Group {
      Title(L10n.swiftUI)
      Text(L10n.ChangeCursor.Swiftui.text1)
      Text(L10n.ChangeCursor.Swiftui.text2)
      Text(L10n.ChangeCursor.Swiftui.text3)
      Code.swiftUI(
        """
        @AccessibilityFocusState
        var viewIsFocused: Bool
        """
      )
      Text(L10n.ChangeCursor.Swiftui.text4)
      Code.swiftUI(
        """
        View()
        .accessibilityFocused(
            $viewIsFocused
        )
        """
      )
      Text(L10n.ChangeCursor.Swiftui.text5)
      Comment(L10n.ChangeCursor.Swiftui.comment)
    }
  }
}
