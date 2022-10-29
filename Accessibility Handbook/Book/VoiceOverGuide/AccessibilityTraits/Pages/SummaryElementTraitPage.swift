//
//  SummaryElementTraitPage.swift
//  Accessibility Handbook
//
//  Created by Maria Fernanda Azolin on 29/10/22.
//

import SwiftUI

struct SummaryElementTraitPage: View, Page {
    let title: String = L10n.SummaryElementTrait.title
    
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
                Text(L10n.SummaryElementTrait.text1)
                    .accessibilityAddTraits(.isSummaryElement)
                Text(L10n.SummaryElementTrait.text2)
                Text(L10n.SummaryElementTrait.text3)
                
                Code.uikit(codeUIKit)
                Code.swiftUI(codeSwiftUI)
                DocButton(link: link, title: title)
            }
            .toAny()
        }
    }
}
