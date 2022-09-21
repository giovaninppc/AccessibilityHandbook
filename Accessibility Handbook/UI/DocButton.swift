//
//  LinkButton.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct DocButton: View {
  let link: String
  let title: String

  var body: some View {
    HStack(alignment: .center) {
      Spacer()
      Link(L10n.appleDoc(title), destination: URL(string: link)!)
        .font(.callout)
        .foregroundColor(.pink)
        .multilineTextAlignment(.center)
      Spacer()
    }
  }
}
