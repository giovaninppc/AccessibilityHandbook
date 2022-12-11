//
//  AboutTheAppView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import StoreKit
import SwiftUI

struct AboutTheAppView: View, Page {
  var title: String { L10n.AboutTheApp.title }

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .regular) {
        history
        game
        disclaimer
        more
      }
      .padding()
    }
    .navigationTitle(title)
  }

  private var history: some View {
    Group {
      Text(L10n.AboutTheApp.History.text1)
      Text(L10n.AboutTheApp.History.text2)
      Text(L10n.AboutTheApp.History.text3)
      Text(L10n.AboutTheApp.History.text4)
      Text(L10n.AboutTheApp.History.text5)
    }
  }

  private var game: some View {
    Group {
      Title(L10n.AboutTheApp.Game.title)
      Text(L10n.AboutTheApp.Game.text1)
      Text(L10n.AboutTheApp.Game.text2)
      Text(L10n.AboutTheApp.Game.text3)
      Comment(L10n.AboutTheApp.Game.comment)
      InternalLink(page: GameView().toAny(), title: L10n.goPlay)
    }
  }

  private var disclaimer: some View {
    Group {
      Title(L10n.AboutTheApp.Disclaimer.title)
      Text(L10n.AboutTheApp.Disclaimer.text1)
      Text(L10n.AboutTheApp.Disclaimer.text2)
      Comment(L10n.AboutTheApp.Disclaimer.comment1)
      Text(L10n.AboutTheApp.Disclaimer.text3)
      Text(L10n.AboutTheApp.Disclaimer.text4)
      InternalLink(page: CollaborationView().toAny(), title: L10n.AboutTheApp.Disclaimer.openCollaborationPage)
    }
  }

  private var more: some View {
    Group {
      Button {
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else { return }
        SKStoreReviewController.requestReview(in: windowScene)

      } label: {
        Text(L10n.AboutTheApp.Review.text)
      }

      Comment(L10n.AboutTheApp.language)
    }
  }
}
