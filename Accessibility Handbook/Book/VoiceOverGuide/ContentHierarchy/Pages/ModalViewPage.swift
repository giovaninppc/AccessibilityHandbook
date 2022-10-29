//
//  ModalViewPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct ModalViewPage: View, Page {
  let title: String = L10n.Modal.title

  let link: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615089-accessibilityviewismodal
  """

  @State private var badModalExample: Bool = false
  @State private var goodModalExample: Bool = false

  @AccessibilityFocusState
  private var isGoodModalFocused: Bool

  var body: some View {
    ZStack {
      PageContent(next: GroupingPage(), deeplink: deeplink) {
        Group {
          intro
          uiKit
          swiftUI
          example
          footNote
          DocButton(link: link, title: title)
        }
        .toAny()
      }

      if badModalExample {
        badModal
      }

      if goodModalExample {
        goodModal
      }
    }
  }

  private var intro: some View {
    Group {
      Text(L10n.Modal.Intro.text1)
      Text(L10n.Modal.Intro.text2)
      InternalLink(page: ElementReadingOrderPage().page, title: L10n.Modal.Intro.link)
      Text(L10n.Modal.Intro.text3)
      Comment(L10n.Modal.Intro.comment1)
      VerticalSpace(.regular)
    }
  }

  private var uiKit: some View {
    Group {
      Title(L10n.uikit)
      Text(L10n.Modal.Uikit.text1)
      Text(L10n.Modal.Uikit.text2)

      Code.uikit(
        """
        myView.accessibilityViewIsModal = true
        """
      )

      Text(L10n.Modal.Uikit.text3)

      Code.uikit(
        """
        class MyView: UIView {
          var isBeingDisplayed: Bool = true
          override var accessibilityViewIsModal: Bool {
            isBeingDisplayed
          }
        }
        """
      )
      VerticalSpace(.regular)
    }
  }

  private var swiftUI: some View {
    Group {
      Title(L10n.swiftUI)
      Text(L10n.Modal.Swiftui.text1)

      Code.swiftUI(
        """
        .accessibilityAddTraits(.isModal)
        """
      )
      VerticalSpace(.regular)
    }
  }

  private var example: some View {
    Group {
      Title(L10n.examples)
      Text(L10n.Modal.Example.text1)

      Centered {
        Group {
          Button {
            badModalExample = true

            UIAccessibility.post(notification: .screenChanged, argument: nil)
          } label: {
            Text(L10n.Modal.Example.badModal)
              .font(.callout.bold())
          }
          HorizontalSpace(.large)
          Button {
            goodModalExample = true
            isGoodModalFocused = true

            UIAccessibility.post(notification: .screenChanged, argument: nil)
          } label: {
            Text(L10n.Modal.Example.goodModal)
              .font(.callout.bold())
          }
        }
        .toAny()
      }
    }
  }

  private var footNote: some View {
    Group {
      Comment(L10n.Modal.Example.comment)
      InternalLink(page: ChangeCursorPositionPage().page, title: L10n.Modal.Example.link)
    }
  }

  private var badModal: some View {
    ZStack {
      modalBackground
      VStack(spacing: .regular) {
        Title(L10n.modal)
        Text(L10n.Modal.Example.thisBadModal)
        Button {
          badModalExample = false
        } label: {
          Text(L10n.dismiss)
            .font(.callout.bold())
        }
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }

  private var goodModal: some View {
    ZStack {
      modalBackground
      VStack(spacing: .regular) {
        Title(L10n.modal)
          .accessibilityFocused($isGoodModalFocused)
        Text(L10n.Modal.Example.thisGoodModal)
        Button {
          goodModalExample = false
        } label: {
          Text(L10n.dismiss)
            .font(.callout.bold())
        }
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
      .accessibilityAddTraits([.isModal])
    }
  }

  private var modalBackground: some View {
    Rectangle()
      .background(.thinMaterial)
      .foregroundColor(.clear)
  }
}
