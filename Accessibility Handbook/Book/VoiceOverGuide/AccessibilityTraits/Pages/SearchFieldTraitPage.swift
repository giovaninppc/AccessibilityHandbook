//
//  SearchFieldTraitPage.swift
//  Accessibility Handbook
//
//  Created by Maria Fernanda Azolin on 28/10/22.
//

import SwiftUI

struct SearchFieldTraitPage: View, Page {
    
    let title: String = L10n.SearchFieldTrait.title
    let animals = ["arara", "cobra", "lagarto"]
    
    let codeUIKit: String = """
    myView.accessibilityTraits = [.searchField]
    """
    
    let codeSwiftUI: String = """
    .accessibilityAddTraits([.isSearchField])
    """
    
    let link: String = """
    https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620199-searchfield
    """
    
    var body: some View {
        PageContent(next: nil) {
            Group {
                Text(L10n.SearchFieldTrait.text1)
                Text(L10n.SearchFieldTrait.text2)
                Text(L10n.SearchFieldTrait.text3)
                
                NavigationLink(destination: SearchBarView()) {
                    Text(L10n.SearchFieldTrait.button)
                        .accessibilityAddTraits(.isButton)
                }
                
                Code.uikit(codeUIKit)
                Code.swiftUI(codeSwiftUI)
                DocButton(link: link, title: title)
            }
            .toAny()
        }
    }
}

struct SearchBarView: View {
    let animals = ["🐝 Bee", "🦜 Bird", "🐈 Cat", "🐄 Cow", "🐶 Dog", "🐍 Snake"]
    @State private var searchText = ""
    
    var body: some View {
            List {
                ForEach(searchResults, id: \.self) { animal in
                    Text(animal)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .accessibilityAddTraits(.isSearchField)
            .accessibilityLabel(L10n.SearchFieldTrait.description)
    }
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return animals
        } else {
            return animals.filter { $0.contains(searchText) }
        }
    }
}
