//
//  SearchView.swift
//  
//
//  Created by Giovani Nascimento Pereira on 30/09/22.
//

import SwiftUI

struct SearchView: View {
  @Binding var text: String

  var body: some View {
    VStack(alignment: .leading, spacing: .regular) {
      ForEach(filteredContent, id: \.id) { page in
        NavigationLink {
          page.page
        } label: {
          let icon: Image? = {
            switch page {
            case is GamePage:
              return Icon.gameController
            default:
              return nil
            }
          }()
          IndexCell(title: page.title, icon: icon)
        }
      }
    }
  }
}

private extension SearchView {
  var allPages: [Page] {
    let guideSections = VoiceOverGuideSections().sections + ColorsSection().sections
      + OthersSections().sections + DynamicFontSections().sections
    let guidePages = guideSections.map { $0.pages }.flatMap { $0 }
    let gamePages = Games.pages
    let aboutPages: [Page] = [AboutTheAppView(), CollaborationView()]
    return guidePages + gamePages + aboutPages
  }

  var filteredContent: [Page] {
    allPages.filter { $0.title.lowercased().contains(text.lowercased()) }
  }
}
