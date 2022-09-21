//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(HomeSections.sections, id: \.id) { section in
          Text(section.title)
            .font(.headline)
            .padding(.top, 10.0)
            .padding(.leading, .regular)
            .accessibilityAddTraits(.isHeader)
          ForEach(section.pages, id: \.id) { page in
            NavigationLink {
              page.page
            } label: {
              HomeCell(title: page.title)
            }
          }
        }
      }
    }
    .navigationTitle(L10n.handbook)
  }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
