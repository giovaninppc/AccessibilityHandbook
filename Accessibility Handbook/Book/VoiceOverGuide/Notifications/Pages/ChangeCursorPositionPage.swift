//
//  ChangeCursorPositionPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct ChangeCursorPositionPage: View, Page {
  var title: String = "Change Cursor Position"

  let codeUIKit: String = """
  UIAccessibility.post(.layoutChanged, argument: nil)
  UIAccessibility.post(.screenChanged, argument: nil)
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibility/notification/1620176-announcement
  """

  var body: some View {
    PageContent(next: nil) {
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
      Text("Most of the time, we want the user to be in control to where the Voice-Over cursor should move to.")
      Text("Sometimes, when we change something on the screen, like presenting a modal on top of everything, we want to redirect the user directly to the new content.")
      Comment("But, to do that, it works different in UIKit and SwiftUI, so we are going to have a section for each in this page")
    }
  }
}

// MARK: - UIKit

private extension ChangeCursorPositionPage {
  var uiKit: some View {
    Group {
      Title("UIKit")
      Text("To change the cursor position on UIKit, we are going to use the screen chnage notifications.")
      InternalLink(page: NotifyScreenChangesPage().page, title: "More on Screen Change notifications.")
      Text("When triggering one of these notifications, we can pass as the argument the view we want the Voice-Over to focus on.")
      Code(
        uiKit: """
        UIAccessibilitypost(.layoutChanged, argument: viewToFocus)
        """
      )
    }
  }
}

// MARK: - SwiftUI

private extension ChangeCursorPositionPage {
  var swiftUI: some View {
    Group {
      Title("SwiftUI")
      Text("On SwiftUI, we are not going to use the Accessibility Notifications, instead, we are using the @AccessibilityFocusState")
      Text("It allow to control if the cursor is focused on a view, and move the navigation to it.")
      Text("First, create a new Boolean property using this wrapper")
      Code(
        swiftUI: """
        @AccessibilityFocusState
        var viewIsFocused: Bool
        """
      )
      Text("Then, assign it to the view you want to control by using a view modifier.")
      Code(
        swiftUI: """
        .accessibilityFocused($isGoodModalFocused)
        """
      )
      Text("Now you can change the focus to the view by setting the property to 'True'.")
      Comment("You can even observe this property to handle something when it focus/unfocus on it.")
    }
  }
}
