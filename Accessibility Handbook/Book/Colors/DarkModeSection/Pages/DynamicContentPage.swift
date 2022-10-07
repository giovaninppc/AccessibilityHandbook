//
//  DynamicContentPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 07/10/22.
//

import SwiftUI

struct DynamicContentPage: View, Page {
  let title: String = "Dynamic content"

  var body: some View {
    PageContent(next: nil) {
      Group {

      }
      .toAny()
    }
  }
}
