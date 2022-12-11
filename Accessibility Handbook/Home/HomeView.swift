//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  @State private var orientation: UIDeviceOrientation = UIDevice.current.orientation
  @State private var isIpad = UITraitCollection.current.userInterfaceIdiom == .pad
  @State private var text: String = ""
  @State private var searching: Bool = false

  private var shouldUseLargeContent: Bool {
    orientation.isLandscape || isIpad
  }

  var body: some View {
    ScrollView(showsIndicators: false) {
      if text.isEmpty {
        if isIpad {
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
    .onRotate { newOrientation in
      orientation = newOrientation
    }
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
