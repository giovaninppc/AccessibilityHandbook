//
//  ReadingOrderPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct ElementReadingOrderPage: View, Page {
  static let strings = L10n.ElementReadingOrder.self

  var title: String = strings.title

  var body: some View {
    PageContent(next: nil) {
      Group {
        
      }
      .toAny()
    }
  }
}
