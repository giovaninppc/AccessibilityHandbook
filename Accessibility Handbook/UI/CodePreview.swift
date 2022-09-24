//
//  CodePreview.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 24/09/22.
//

import SwiftUI

struct CodePreview: View {
  let code: String
  let title: String
  let icon: String

  @Environment(\.dismiss) var dismiss

  var body: some View {
    VStack(spacing: .zero) {
      closeButton
      titleView
      VerticalSpace(.large)
      codeView
      VerticalSpace(.large)
      copyButon
      Spacer()
    }
  }
}

private extension CodePreview {
  var codeView: some View {
    Text(SyntaxHighlight().highlight(code: code))
      .font(.callout.monospaced())
      .fixedSize(horizontal: false, vertical: true)
      .padding()
  }

  var closeButton: some View {
    HStack {
      Spacer()
      Button {
        dismiss()
      } label: {
        Image(systemName: "xmark")
      }
      .accessibilityLabel("Close code view")
    }
    .padding()
  }

  var titleView: some View {
    HStack {
      HorizontalSpace(.regular)
      Image(systemName: icon)
      Text(title)
        .font(.subheadline.bold())
      Spacer()
    }
    .padding()
  }

  var separator: some View {
    Rectangle()
      .foregroundColor(.tertiaryBackground)
      .accessibilityHidden(true)
      .frame(height: .single)
      .padding(.horizontal)
  }

  var buttonsStack: some View {
    HStack {
      Image(systemName: icon)
      Text(title)
        .font(.subheadline)
      Spacer()
    }
  }

  var copyButon: some View {
    Centered {
      Button {
        copy(code: code)
      } label: {
        HStack {
          Image(systemName: "doc.on.doc.fill")
          Text("Copy code")
        }
      }
      .toAny()
    }
  }

  func copy(code: String) {
    UIPasteboard.general.string = code
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      UIAccessibility.post(notification: .announcement, argument: "Code copied!")
    }
  }
}
