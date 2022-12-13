//
//  AddTheCorrectTraits.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct AddTheCorrectTraitsPage: View, Page {
  let title: String = L10n.AddTraits.title

  @State private var item1: Bool = false
  @State private var item2: Bool = true
  @State private var item3: Bool = false

  var body: some View {
    PageContent(next: HandleAllTheViewActionsPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        button
        links
        headers
        selected
        outro
      }
      .toAny()
    }
  }
}

private extension AddTheCorrectTraitsPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.AccTraits.title, destination: ListOfAccessibilityTraitsPage().page)
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.AddTraits.text1)
    Text(L10n.AddTraits.text2)
    Comment(L10n.AddTraits.comment1)
    Text(L10n.AddTraits.text3)
  }

  @ViewBuilder
  var button: some View {
    Title(L10n.AddTraits.Button.title)
    Text(L10n.AddTraits.Button.text1)
    Text(L10n.AddTraits.Button.text2)
    Code.swiftUI("""
    VStack {
      ...
    }
    .accessibilityElement(children: .combine)
    .accessibilityAddTraits(.isButton)
    .accessibilityAction {
      // Handle cell tap action
    }
    """)
    Code.uikit("""
    class MyView: UIView {
      func setupAccessibility() {
        isAccessibilityElement = true
        accessibilityTraits = [.button]
      }

      override func accessibilityActivate() -> Bool {
        // Handle cell tap action
        return true
      }
    }
    """)
  }

  @ViewBuilder
  var links: some View {
    Title(L10n.AddTraits.Link.title)
    Text(L10n.AddTraits.Link.text1)
    Centered {
      ExternalLink(link: "https://github.com/giovaninppc/AccessibilityHandbook", title: L10n.Collaboration.githubPreoject)
        .toAny()
    }
    Comment(L10n.AddTraits.Link.comment1)
  }

  @ViewBuilder
  var headers: some View {
    Disclaimer.beforeYouReadThis(check: L10n.RotorAndHeaders.title, destination: RotorAndHeadersPage().page)
    Title(L10n.AddTraits.Header.title)
    Text(L10n.AddTraits.Header.text1)
    Text(L10n.AddTraits.Header.text2)
    Comment(L10n.AddTraits.Header.comment1)
  }

  @ViewBuilder
  var selected: some View {
    Title(L10n.AddTraits.Selected.title)
    Text(L10n.AddTraits.Selected.text1)
    Text(L10n.AddTraits.Header.text2)
    selectedExample
  }

  @ViewBuilder
  var outro: some View {
    Text(L10n.AddTraits.Outro.text1)
  }
}

private extension AddTheCorrectTraitsPage {
  @ViewBuilder
  var selectedExample: some View {
    VerticalSpace(.regular)
    selectedItem(selected: $item1)
    selectedItem(selected: $item2)
    selectedItem(selected: $item3)
    VerticalSpace(.regular)
  }

  func selectedItem(selected: Binding<Bool>) -> some View {
    Button {
      item1 = false
      item2 = false
      item3 = false
      selected.wrappedValue = true
    } label: {
      VStack {
        HStack {
          Text("Item")
          Spacer()
          selected.wrappedValue ? Icon.checkmark : Icon.circle
        }
        Divider()
      }
    }
    .accessibilityElement(children: .combine)
    .accessibilityAddTraits(selected.wrappedValue ? [.isButton, .isSelected] : [.isButton])
  }
}
