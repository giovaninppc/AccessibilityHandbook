//
//  HiddenObjectsPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct IsItAModalPage: View, Page {
  let title: String = L10n.IsThisModal.title

  @State var isPresentingModal: Bool = false
  @AccessibilityFocusState
  private var isGoodModalFocused: Bool

  var body: some View {
    ZStack {
      PageContent(next: HandleAnimationsPage(), deeplink: deeplink) {
        Group {
          disclaimer
          intro
          changeFocus
        }
        .toAny()
      }
      if isPresentingModal {
        modal
      }
    }
  }
}

private extension IsItAModalPage {
  @ViewBuilder
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.Modal.title, destination: ModalViewPage().deeplink)
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.IsThisModal.text1)
    Text(L10n.IsThisModal.text2)
    Text(L10n.IsThisModal.text3)
  }

  @ViewBuilder
  var changeFocus: some View {
    Title(L10n.IsThisModal.ChangeFocus.title)
    Disclaimer.beforeYouReadThis(check: L10n.ChangeCursor.title, destination: ChangeCursorPositionPage().deeplink)
    Text(L10n.IsThisModal.ChangeFocus.text1)
    Text(L10n.IsThisModal.ChangeFocus.text2)
    Text(L10n.IsThisModal.ChangeFocus.text3)
    Text(L10n.IsThisModal.ChangeFocus.text4)
    Comment(L10n.IsThisModal.ChangeFocus.comment1)
    modalButton
  }
}

private extension IsItAModalPage {
  var modalButton: some View {
    Button {
      isPresentingModal = !isPresentingModal
    } label: {
      Text(L10n.modal)
    }
  }

  var modal: some View {
    ZStack {
      modalBackground
      VStack(spacing: .regular) {
        Title(L10n.modal)
          .accessibilityFocused($isGoodModalFocused)
        Text(L10n.Modal.Example.thisGoodModal)
        Button {
          isPresentingModal = false
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
