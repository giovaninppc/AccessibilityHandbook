//
//  CustomActionsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct CustomActionsPage: View, Page {
  var title: String = L10n.CustomActions.title

  let codeUIKit: String = """
  let editAction = UIAccessibilityCustomAction()
  let selectAction = UIAccessibilityCustomAction()
  let deleteAction = UIAccessibilityCustomAction()

  accessibilityCustomActions = [
    editAction,
    selectAction,
    deleteAction
  ]
  """

  let codeSwiftUI: String = """
  .accessibilityAction(named: Text("\(L10n.select)")) {
    // Handle Select
  }
  .accessibilityAction(named: Text("\(L10n.edit)")) {
    // Handle Edit
  }
  .accessibilityAction(named: Text("\(L10n.delete)")) {
    // Handle Delete
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitycustomaction
  """

  var body: some View {
    PageContent(next: MagicTapPage()) {
      Group {
        Text(L10n.CustomActions.text1)
        Comment(L10n.CustomActions.comment1)
        Text(L10n.CustomActions.text4)
        Text(L10n.CustomActions.text3)
        Text(L10n.CustomActions.text4)
        example
        Comment(L10n.CustomActions.comment2)
        Code.uikit(codeUIKit)
        Code.swiftUI(codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }

  private var example: some View {
    Group {
      VerticalSpace(.regular)
      Centered {
        VStack(spacing: .regular) {
          Title(L10n.CustomActions.creditCard)
          Text("**** **** **** 1234")
          HStack(spacing: .regular) {
            Button {
              //
            } label: {
              (Text(Icon.pencil) + Text(String.space) + Text(L10n.select))
            }
            Button {
              //
            } label: {
              (Text(Icon.checkmark) + Text(String.space) + Text(L10n.select))
            }
            Button {
              //
            } label: {
              (Text(Icon.trash) + Text(String.space) + Text(L10n.delete))
            }
          }
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel(L10n.CustomActions.accessible)
        .accessibilityAction(named: Text(L10n.select)) {
          UIAccessibility.post(notification: .announcement, argument: L10n.selected)
        }
        .accessibilityAction(named: Text(L10n.edit)) {
          UIAccessibility.post(notification: .announcement, argument: L10n.edited)
        }
        .accessibilityAction(named: Text(L10n.delete)) {
          UIAccessibility.post(notification: .announcement, argument: L10n.deleted)
        }
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }
      VerticalSpace(.regular)
    }
  }
}
