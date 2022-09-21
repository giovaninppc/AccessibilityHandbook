//
//  IndexView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct IndexView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(VoiceOverGuideSections.sections, id: \.id) { section in
          Text(section.title)
            .font(.headline)
            .padding(.top, 30.0)
            .padding(.leading, .regular)
            .accessibilityAddTraits(.isHeader)
          ForEach(section.pages, id: \.id) { page in
            NavigationLink {
              page.page
            } label: {
              IndexCell(title: page.title)
            }
          }
        }
      }
    }
    .navigationTitle("Voice-Over Guide")
    .toolbar {
      NavigationLink {
        //
      } label: {
        Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
      }
    }
  }
}
