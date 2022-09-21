//
//  Space().swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct VerticalSpace: View {
  let size: CGFloat

  init(_ size: CGFloat) {
    self.size = size
  }

  var body: some View {
    Spacer()
      .frame(height: size)
  }
}

struct HorizontalSpace: View {
  let size: CGFloat

  init(_ size: CGFloat) {
    self.size = size
  }

  var body: some View {
    Spacer()
      .frame(width: size)
  }
}
