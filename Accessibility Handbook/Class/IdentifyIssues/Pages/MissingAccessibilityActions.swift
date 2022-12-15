//
//  MissingAccessibilityActions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 15/12/22.
//

import SwiftUI

struct MissingAccessibilityActions: View, Page {
  let title: String = L10n.MissingAccessibilityActions.title

  var body: some View {
    PageContent(next: nil, deeplink: deeplink) {
      Group {
        disclaimer
        intro
        gesture
        groupButtons
      }
      .toAny()
    }
  }
}

private extension MissingAccessibilityActions {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.ValidateColors.title, destination: ValidateColorsPage().deeplink)
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.MissingAccessibilityActions.text1)
    Text(L10n.MissingAccessibilityActions.text2)
  }

  @ViewBuilder
  var gesture: some View {
    Title(L10n.MissingAccessibilityActions.Gesture.title)
    Text(L10n.MissingAccessibilityActions.Gesture.text1)

    Comment(L10n.MissingAccessibilityActions.Gesture.comment1)
    Code.swiftUI("""
    VStack {
      Text("Title")
      Text("Subtitle")
    }
    .accessibilityElement(
      children: .combine
    )
    .onTapGesture {
      // Perform Action
    }
    """)
    Text(L10n.MissingAccessibilityActions.Gesture.text2)
    Code.swiftUI("""
    VStack {
      Text("Title")
      Text("Subtitle")
    }
    .accessibilityElement(
      children: .combine
    )
    .onTapGesture {
      // Perform Action
    }
    .accessibilityAction {
      // Perform Action as well
    }
    """)
  }

  @ViewBuilder
  var groupButtons: some View {
    Title(L10n.MissingAccessibilityActions.Group.title)
    Text(L10n.MissingAccessibilityActions.Group.text1)
    Text(L10n.MissingAccessibilityActions.Group.text2)
    Code.swiftUI("""
    VStack {
      Text("Title")
      Text("Subtitle")
      Button {
        openEditPage()
      } label: {
        Text("Edit")
      }
    }
    .accessibilityElement(
      children: .combine
    )
    """)
    Text(L10n.MissingAccessibilityActions.Group.text3)
    Code.swiftUI("""
    VStack {
      Text("Title")
      Text("Subtitle")
      Button {
        openEditPage()
      } label: {
        Text("Edit")
      }
    }
    .accessibilityElement(
      children: .combine
    )
    .accessibilityAddTraits(
      .isButton
    )
    .accessibilityAction {
      openEditPage()
    }
    """)
    Comment(L10n.MissingAccessibilityActions.Group.comment1)
    InternalLink(deeplink: CustomActionsPage().deeplink, title: L10n.CustomActions.title)
  }
}
