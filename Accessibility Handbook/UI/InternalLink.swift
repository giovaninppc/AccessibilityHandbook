//
//  InternalLink.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct InternalLink: View {
  let page: AnyView?
  let deeplink: Deeplink?
  let title: String

  init(page: AnyView? = nil, deeplink: Deeplink? = nil, title: String) {
    self.page = page
    self.deeplink = deeplink
    self.title = title
  }

  var body: some View {
    HStack(alignment: .center) {
      if deeplink != nil {
        modalLink
      } else {
        navigationLink
      }
      Spacer()
    }
  }
}

private extension InternalLink {
  var navigationLink: some View {
    NavigationLink {
      page
    } label: {
      content
    }
  }

  var modalLink: some View {
    Button {
      open(deeplink!)
    } label: {
      content
    }
  }

  var content: some View {
    Text(title)
      .font(.callout.bold())
      .foregroundColor(.pink)
      .multilineTextAlignment(.leading)
  }

  private func open(_ link: Deeplink) {
    guard let url = URL(string: link) else { return }
    UIApplication.shared.open(url)
  }
}
