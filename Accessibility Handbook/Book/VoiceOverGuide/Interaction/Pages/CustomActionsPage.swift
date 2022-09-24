//
//  CustomActionsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct CustomActionsPage: View, Page {
  var title: String = "Custom Actions"

  let codeUIKit: String = """
  let editAction = UIAccessibilityCustomAction()
  let selectAction = UIAccessibilityCustomAction()
  let deleteAction = UIAccessibilityCustomAction()

  accessibilityCustomActions = [
    editAction, selectAction, deleteAction
  ]
  """

  let codeSwiftUI: String = """
  .accessibilityAction(named: Text("Select")) {
    // Handle Select
  }
  .accessibilityAction(named: Text("Edit")) {
    // Handle Edit
  }
  .accessibilityAction(named: Text("Delete")) {
    // Handle Delete
  }
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitycustomaction
  """

  var body: some View {
    PageContent(next: MagicTapPage()) {
      Group {
        Text("'Custom Actions' is the name of the ability to add multiple actions to be executed on the same view. When focused, the Voice-Over will read 'actions available' at the end, meaning you can swipe up and down to change the action that will be executed when you activate the element.")
        Comment("But, when would I even use that?")
        Text("It's a goos tool to improve the accessibility on elements that can perform multiple actions.")
        Text("Like a Card cell, which can select the card, delete, edit")
        Text("Usually you'd have multiple buttons for each action, but focusing on each individual button would not be a very good Voice-Over experience.")
        example
        Comment("I find custom actions to be also very useful when some of the actions are hidden behind an animation, like when you need to tap an icon, something changes, and other icons appears.")
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
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
          Title("Available Card")
          Text("**** **** **** 1234")
          HStack(spacing: .regular) {
            Button {
              //
            } label: {
              (Text(Image(systemName: "pencil")) + Text(" ") + Text("Edit"))
            }
            Button {
              //
            } label: {
              (Text(Image(systemName: "checkmark.circle.fill")) + Text(" ") + Text("Select"))
            }
            Button {
              //
            } label: {
              (Text(Image(systemName: "trash.fill")) + Text(" ") + Text("Delete"))
            }
          }
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Available Card, final 1234")
        .accessibilityAction(named: Text("Select")) {
          UIAccessibility.post(notification: .announcement, argument: "Selected")
        }
        .accessibilityAction(named: Text("Edit")) {
          UIAccessibility.post(notification: .announcement, argument: "Edited")
        }
        .accessibilityAction(named: Text("Delete")) {
          UIAccessibility.post(notification: .announcement, argument: "Deleted")
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
