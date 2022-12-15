//
//  DeeplinkHandler.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/10/22.
//

import SwiftUI

let baseDeeplinkScheme = "accessibilityHandbook"

typealias Deeplink = String

final class DeeplinkHandler {
  private let scheme: String = baseDeeplinkScheme
  private var page: AnyView?

  func canOpen(url: URL) -> Bool {
    guard url.scheme == scheme else { return false }

    if let page = matchingPage(for: url) {
      self.page = page
    } else if let indexPage = matchingIndexPage(for: url) {
      self.page = indexPage
    } else if let indexPage = matchingCustomPage(for: url) {
      self.page = indexPage
    } else {
      return false
    }
    return true
  }

  @ViewBuilder
  func deeplinkView() -> some View {
    page ?? EmptyView().toAny()
  }
}

private extension DeeplinkHandler {
  var allPages: [Page] { AllPagesProvider().allPages }

  func matchingPage(for url: URL) -> AnyView? {
    guard let match = allPages.first(where: { $0.deeplink == url.absoluteString }) else { return nil }
    return match.page
  }

  func matchingCustomPage(for url: URL) -> AnyView? {
    guard let match = CustomPageDeeplinks.deeplinks[url.absoluteString] else { return nil }
    return match
  }

  func matchingIndexPage(for url: URL) -> AnyView? {
    guard let match = IndexView.deeplinks[url.absoluteString] else { return nil }
    return match
  }
}

func open(_ deeplink: Deeplink) {
  guard let url = URL(string: deeplink) else { return }
  UIApplication.shared.open(url)
}
