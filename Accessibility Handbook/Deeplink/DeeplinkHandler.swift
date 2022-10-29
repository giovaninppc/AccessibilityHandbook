//
//  DeeplinkHandler.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/10/22.
//

import SwiftUI

let baseDeeplinkScheme = "accessibilityHandbook"

final class DeeplinkHandler {
  private let scheme: String = baseDeeplinkScheme
  private var page: Page?

  func canOpen(url: URL) -> Bool {
    guard url.scheme == scheme else { return false }
    guard let page = matchingPage(for: url) else { return false }
    self.page = page
    return true
  }

  @ViewBuilder
  func deeplinkView() -> some View {
    page!.page
  }

  func handle(url: URL) -> AnyView? {
    guard url.scheme == scheme else { return nil }
    guard let page = matchingPage(for: url) else { return nil }
    return page.page
  }
}

private extension DeeplinkHandler {
  var allPages: [Page] { AllPagesProvider().allPages }

  func matchingPage(for url: URL) -> Page? {
    guard let match = allPages.first(where: { $0.deeplink == url.absoluteString }) else { return nil }
    return match
  }
}
