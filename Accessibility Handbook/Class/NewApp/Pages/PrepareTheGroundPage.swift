//
//  PreparingTheGround.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 11/12/22.
//

import SwiftUI

struct PrepareTheGroundPage: View, Page {
  let title: String = L10n.PrepareTheGround.title

  var body: some View {
    PageContent(next: CreatingAColorFilePage(), deeplink: deeplink) {
      Group {
        intro
        whatToSupport
      }
      .toAny()
    }
  }
}

private extension PrepareTheGroundPage {
  @ViewBuilder
  var intro: some View {
    Text(L10n.PrepareTheGround.text1)
    Centered {
      Asset.xcode.swiftUIImage
        .accessibilityLabel(L10n.PrepareTheGround.xcodeLogo)
        .toAny()
    }
    Text(L10n.PrepareTheGround.text2)
    Text(L10n.PrepareTheGround.text3)
    Text(L10n.PrepareTheGround.text4)
  }

  @ViewBuilder
  var whatToSupport: some View {
    Title(L10n.PrepareTheGround.WhatToSupport.title)
    Text(L10n.PrepareTheGround.WhatToSupport.text1)
    Text(L10n.PrepareTheGround.WhatToSupport.text2)
    Text(L10n.PrepareTheGround.WhatToSupport.text3)
    Text(L10n.PrepareTheGround.WhatToSupport.comment1)
    Text(L10n.PrepareTheGround.WhatToSupport.text4)
  }
}
