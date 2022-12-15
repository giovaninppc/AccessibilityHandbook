//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  @State private var text: String = ""
  @State private var searching: Bool = false

  @Environment(\.horizontalSizeClass)
  var horizontalSizeClass: UserInterfaceSizeClass?

  @Environment(\.verticalSizeClass)
  var verticalSizeClass: UserInterfaceSizeClass?

  private var isIPad: Bool {
    horizontalSizeClass == .regular && verticalSizeClass == .regular
  }

  var body: some View {
    ScrollView(showsIndicators: false) {
      if text.isEmpty {
        if isIPad {
          PadHomeView()
        } else {
          PhoneHomeView()
        }
      } else {
        SearchView(text: $text)
      }
    }
    .searchable(text: $text, placement: .navigationBarDrawer(displayMode: searching ? .always : .automatic))
    .navigationTitle(L10n.handbook)
    .toolbar {
      Button {
        searching.toggle()
      } label: {
        Icon.search
      }
      .accessibilityLabel(L10n.search)
    }
  }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
