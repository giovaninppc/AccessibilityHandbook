//
//  SummaryElementTraitPage.swift
//  Accessibility Handbook
//
//  Created by Maria Fernanda Azolin on 29/10/22.
//

import SwiftUI

struct SummaryElementTraitPage: View, Page {
    let title: String = L10n.ImageTrait.title
    
    let codeUIKit: String = """
    myView.accessibilityTraits = [.summaryElement]
    """
    
    let codeSwiftUI: String = """
    .accessibilityAddTraits([.isSummaryElement])
    """
    
    let link: String = """
    https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620174-image
    """
    
    var body: some View {
        PageContent(next: nil, deeplink: deeplink) {
            Group {
                Text(L10n.ImageTrait.text1)
                Text(L10n.ImageTrait.text2)
                Text(L10n.ImageTrait.text3)
                Asset.prettyColors.swiftUIImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .accessibilityLabel(L10n.ImageTrait.description)
                Code.uikit(codeUIKit)
                Code.swiftUI(codeSwiftUI)
                DocButton(link: link, title: title)
            }
            .toAny()
        }
    }
}
