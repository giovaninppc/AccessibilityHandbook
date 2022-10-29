//
//  PageContent.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct PageContent: View {
  let next: Page?
  let deeplink: String
  let content: () -> AnyView

  @Environment(\.dismiss) var dismiss

  var body: some View {
    VStack {
      ScrollView {
        HStack {
          VStack(alignment: .leading, spacing: .regular) {
            content()
          }
          .padding()
          Spacer()
        }
      }
      HStack {
        Spacer()
        if let next = next {
          NavigationLink {
            next.page
          } label: {
            NextPageButton(title: next.title)
          }
          .accessibilityElement(children: .combine)
          .accessibilityLabel(L10n.nextPage(next.title))
        }
      }
      .padding()
    }
    .toolbar {
      Button {
        share()
      } label: {
        Icon.share
      }
      .accessibilityLabel(L10n.sharePage)
    }
  }
}

private extension PageContent {
  func share() {
    guard let url = URL(string: deeplink) else { return }
    let activityController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
    let scenes = UIApplication.shared.connectedScenes
    guard let windowScene = scenes.first as? UIWindowScene,
          let window = windowScene.windows.first,
          let root = window.rootViewController else { return }
    root.present(activityController, animated: true, completion: nil)
  }
}

struct NextPageButton: View {
  let title: String?

  var body: some View {
    if let title = title {
      HStack {
        Text(title)
        Icon.arrowRight
      }
    }
  }
}
