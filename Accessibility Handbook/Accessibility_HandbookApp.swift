//
//  Accessibility_HandbookApp.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import Handbook
import SwiftUI

@main
struct Accessibility_HandbookApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        HomeView()
      }
      .navigationViewStyle(.stack)
    }
  }
}
