//
//  SearchView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 28/10/22.
//

import SwiftUI

struct SearchView: View {
  @Binding var text: String
  private let allPagesProvider = AllPagesProvider()
  @State private var isSearchingAll: Bool = false

  var body: some View {
    searchView
      .onChange(of: text) { _ in
        isSearchingAll = false
      }
  }
}

private extension SearchView {
  var allPages: [Page] { allPagesProvider.allPages }

  var filteredContent: [Page] {
    allPages.filter { $0.title.lowercased().contains(text.lowercased()) }
  }

  @ViewBuilder
  var searchView: some View {
    if isSearchingAll || !filteredContent.isEmpty {
      searchedContent
    } else {
      emptyContent
    }
  }

  var emptyContent: some View {
    VStack(spacing: .regular) {
      VerticalSpace(100.0)
      Asset.emptySearch.swiftUIImage
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 250.0)
        .accessibilityHidden(true)
      Title(L10n.Search.Empty.title)
      Text(L10n.Search.Empty.message)
      Button {
        isSearchingAll = true
      } label: {
        Text(L10n.Search.Empty.action)
          .font(.callout).bold()
      }
      Spacer()
    }
  }

  var searchedContent: some View {
    VStack(alignment: .leading, spacing: .regular) {
      ForEach(isSearchingAll ? allPages : filteredContent, id: \.id) { page in
        NavigationLink {
          page.page
        } label: {
          IndexCell(title: page.title, icon: icon(for: page))
        }
      }
    }
  }

  func icon(for page: Page) -> Image? {
    allPagesProvider.pageIconDict[page.id]
  }
}
