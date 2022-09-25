//
//  AnnouncementPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct NotifyScreenChangesPage: View, Page {
  let title: String = L10n.NotifyChanges.title

  let codeUIKit: String = """
  UIAccessibility
    .post(
      .layoutChanged, //.screenChanged
      argument: nil
    )
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibility/notification/1620176-announcement
  """

  var body: some View {
    PageContent(next: ChangeCursorPositionPage()) {
      Group {
        header
        example
        footer
      }
      .toAny()
    }
  }
}

// MARK: - Content

private extension NotifyScreenChangesPage {
  var header: some View {
    Group {
      Text(L10n.NotifyChanges.text1)
      Text(L10n.NotifyChanges.text2)
      Text(L10n.NotifyChanges.text3)
    }
  }

  var footer: some View {
    Group {
      Code(code: codeUIKit, icon: nil, title: nil)
      Comment(L10n.NotifyChanges.comment1)
      Comment(L10n.NotifyChanges.comment2)
      DocButton(link: link, title: title)
    }
  }
}

// MARK: - Example

private extension NotifyScreenChangesPage {
  var example: some View {
    Group {
      VerticalSpace(.regular)
      Button {
        UIAccessibility.post(notification: .screenChanged, argument: nil)
      } label: {
        Text(L10n.NotifyChanges.screenChange)
          .font(.callout.bold())
      }

      Button {
        UIAccessibility.post(notification: .layoutChanged, argument: nil)
      } label: {
        Text(L10n.NotifyChanges.layoutChange)
          .font(.callout.bold())
      }

      VerticalSpace(.regular)
    }
  }
}
