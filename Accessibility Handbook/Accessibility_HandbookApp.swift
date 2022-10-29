//
//  Accessibility_HandbookApp.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

@main
struct Accessibility_HandbookApp: App {
  @State private var isShowingDeeplink: Bool = false
  @State private var isPresentingDeeplink: Bool = false
  @State private var deeplinkPage: Page?

  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
      }
      .navigationViewStyle(.stack)
      .onOpenURL { url in
        print(url)
        deeplinkPage = DeeplinkHandler().handle(url: url)
      }
      .sheet(isPresented: $isPresentingDeeplink, onDismiss: {
        isPresentingDeeplink = false
      }) {
        deeplinkPage?.page ?? EmptyView().toAny()
      }
    }
  }
}

final class DeeplinkHandler {
  private let scheme: String = "accessibility_handbook"


  func handle(url: URL) -> Page? {
    guard url.scheme == scheme else { return nil }
    guard let page = matchingPage(for: url.path) else { return nil }
    print(page)
    return page
  }
}

private extension DeeplinkHandler {
  var allPages: [Page] { AllPagesProvider().allPages }

  func matchingPage(for path: String) -> Page? {
    guard let match = allPages.first(where: { $0.id.lowercased() == path }) else { return nil }
    return match
  }
}
