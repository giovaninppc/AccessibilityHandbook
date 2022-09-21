//
//  HeaderTraitPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct HeaderTraitPage: View, Page {
  var title: String = "Header Trait"

  let codeUIKit: String = """
  myView.accessibilityTraits = [.header]
  """

  let codeSwiftUI: String = """
  .accessibilityAddTraits([.isHeader])
  """

  let link: String = """
  https://developer.apple.com/documentation/uikit/uiaccessibilitytraits/1620170-header
  """

  var body: some View {
    PageContent(next: nil) {
      Group {
        Text("The Header trait is used to describe headers (obviously), which indicates the beggining of a new content section.")
        Comment("So... that's all?")
        Text("The fun part, is that you can navigate only on headers by using the rotor function.")
        Text("This way, you can skip every content that is not a header, and find easily the content you are looking for.")
        Code(uiKit: codeUIKit, swiftUI: codeSwiftUI)
        DocButton(link: link, title: title)
      }
      .toAny()
    }
  }
}
