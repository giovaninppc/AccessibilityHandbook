//
//  LongPressPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct LongPressPage: View, Page {
  var title: String = "Long Press"

  var body: some View {
    PageContent(next: AdjustablePage()) {
      Group {

      }
      .toAny()
    }
  }
}
