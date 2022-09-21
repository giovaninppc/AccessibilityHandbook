//
//  ActivatePage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct ActivatePage: View, Page {
  var title: String = "Activate Element"

  var body: some View {
    PageContent(next: LongPressPage()) {
      Group {

      }
      .toAny()
    }
  }
}
