//
//  DismissPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 29/09/22.
//

import SwiftUI

struct DismissPage: View, Page {
  let title: String = ""

  var body: some View {
    PageContent(next: nil) {
      Group {
        DismissGesture()
          .frame(width: nil, height: 100.0)
      }
      .toAny()
    }
  }
}
