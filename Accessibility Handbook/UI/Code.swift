//
//  Code.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct Code: View {
  let uiKit: String?
  let swiftUI: String?

  @State private var copiedUIKit: Bool = false
  @State private var copiedSwiftUI: Bool = false

  init(uiKit: String? = nil, swiftUI: String? = nil) {
    self.uiKit = uiKit
    self.swiftUI = swiftUI
  }

  var body: some View {
    VStack(spacing: .regular) {
      if let uiKit = uiKit {
        codeBlock(code: uiKit, icon: .init(systemName: "uiwindow.split.2x1"), title: "UIKit", copied: $copiedUIKit) {
          animateSelection($copiedUIKit)
        }
      }
      if let swiftUI = swiftUI {
        codeBlock(code: swiftUI, icon: .init(systemName: "swift"), title: "SwiftUI", copied: $copiedSwiftUI) {
          animateSelection($copiedSwiftUI)
        }
      }
    }
  }

  @ViewBuilder
  private func codeBlock(code: String, icon: Image, title: String, copied: Binding<Bool>, onCopy: @escaping () -> Void) -> some View {
    VStack(alignment: .leading, spacing: .regular) {
      HStack {
        icon
        Text(title)
          .font(.subheadline)
        Spacer()
      }
      Text(code)
        .font(.callout)
        .fixedSize(horizontal: false, vertical: true)
    }
    .padding()
    .background {
      RoundedRectangle(cornerRadius: 10.0)
        .foregroundColor(.secondaryBackground)
    }
    .overlay {
      ZStack {
        RoundedRectangle(cornerRadius: 10.0)
          .background(Color.tertiaryBackground)
          .foregroundColor(.clear)
          .opacity(0.9)
        Text("Code copied!")
          .font(.body.bold())
      }
      .opacity(copied.wrappedValue ? 1.0 : 0.0)
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(Text("\(title) code example."))
    .accessibilityHint(Text("Tap twice to copy it."))
    .onTapGesture {
      copy(code: code)
      onCopy()
    }
    .accessibilityAction {
      copy(code: code)
      onCopy()
    }
  }

  private func copy(code: String) {
    UIPasteboard.general.string = code
    UIAccessibility.post(notification: .announcement, argument: "Code copied!")
  }

  private func animateSelection(_ binded: Binding<Bool>) {
    withAnimation {
      binded.wrappedValue = !binded.wrappedValue
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      guard binded.wrappedValue else { return }
      withAnimation {
        binded.wrappedValue = false
      }
    }
  }
}
