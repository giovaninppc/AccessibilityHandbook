//
//  Code.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct Code: View {
  let code: String?
  let icon: String?
  let title: String?

  @State private var copied: Bool = false
  @State private var sheet = false

  static func uikit(_ code: String) -> Code {
    .init(code: code, icon: "uiwindow.split.2x1", title: "UIKit")
  }

  static func swiftUI(_ code: String) -> Code {
    .init(code: code, icon: "swift", title: "SwiftUI")
  }

  var body: some View {
    VStack(spacing: .regular) {
      if code != nil {
        codeView
        VerticalSpace(.small)
      }
    }
    .sheet(isPresented: $sheet) {
      CodePreview(code: code ?? "", title: title, icon: icon)
    }
  }

}

// MARK: - Subviews

private extension Code {
  var codeView: some View {
    VStack(alignment: .leading, spacing: .regular) {
      heading
      ScrollView(.horizontal, showsIndicators: false) {
        codeContent
      }
    }
    .padding()
    .background { background }
    .overlay { overlay }
    .accessibilityElement(children: .combine)
    .accessibilityLabel(Text("\(title ?? "") code example."))
    .accessibilityHint(Text("Tap twice to open code in full screen, and tap three times to copy."))
    .onTapGesture {
      sheet = true
    }
    .accessibilityAction {
      sheet = true
    }
    .onLongPressGesture {
      copy(code: code ?? "")
      animateSelection($copied)
    }
  }

  var heading: some View {
    HStack {
      if let icon = icon {
        Image(systemName: icon)
      }
      if let title = title {
        Text(title)
          .font(.subheadline.bold())
      }
      Spacer()
    }
  }

  var codeContent: some View {
    Text(SyntaxHighlight().highlight(code: code ?? ""))
      .font(.callout.monospaced())
      .frame(maxWidth: .infinity)
      .fixedSize(horizontal: false, vertical: true)
  }

  var overlay: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 10.0)
        .background(Color.tertiaryBackground)
        .foregroundColor(.clear)
        .opacity(0.9)
      Text("Code copied!")
        .font(.body.bold())
    }
    .opacity(copied ? 1.0 : 0.0)
  }

  var background: some View {
    RoundedRectangle(cornerRadius: 10.0)
      .foregroundColor(.secondaryBackground)
  }
}

// MARK: - Actions

private extension Code {
  private func copy(code: String) {
    UIPasteboard.general.string = code
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      UIAccessibility.post(notification: .announcement, argument: "Code copied!")
    }
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
