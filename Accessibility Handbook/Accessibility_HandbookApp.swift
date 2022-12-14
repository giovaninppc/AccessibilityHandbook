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
  @State private var isPresentingWhatsNew: Bool = false

  private let deeplinkHandler = DeeplinkHandler()
  private let lastSeenVersion = VersionStates.self

  var body: some Scene {
    WindowGroup {
      home
      .onOpenURL { url in
        isPresentingDeeplink = deeplinkHandler.canOpen(url: url)
      }
      .sheet(isPresented: $isPresentingDeeplink, onDismiss: {
        isPresentingDeeplink = false
      }) {
        deeplink
      }
      .onAppear(perform: {
        isPresentingWhatsNew = lastSeenVersion.shouldDisplayWhatsNew()
      })
      .sheet(isPresented: $isPresentingWhatsNew, onDismiss: {
        isPresentingWhatsNew = false
      }) {
        whatsNew
      }
    }
  }

  private var home: some View {
    NavigationView {
      HomeView()
    }
    .navigationViewStyle(.stack)
  }

  private var deeplink: some View {
    NavigationView {
      deeplinkHandler.deeplinkView()
    }
    .navigationViewStyle(.stack)
  }

  private var whatsNew: some View {
    NavigationView {
      WhatsNewView().page
    }
    .navigationViewStyle(.stack)
  }
}
