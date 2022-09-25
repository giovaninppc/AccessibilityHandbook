//
//  CodePreview.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 24/09/22.
//

import SwiftUI

struct CodePreview: View {
  let code: String
  let title: String?
  let icon: String?

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
        Icon.close
      }
      .accessibilityLabel(L10n.closeCodeView)
    }
    .padding()
  }

  var titleView: some View {
    HStack {
      HorizontalSpace(.regular)
      if let icon = icon {
        Image(systemName: icon)
      }

      if let title = title {
        Text(title)
          .font(.subheadline.bold())
      }

      Spacer()
    }
    .accessibilityElement(children: .combine)
    .padding()
  }

  var separator: some View {
    Rectangle()
      .foregroundColor(.tertiaryBackground)
      .accessibilityHidden(true)
      .frame(height: .single)
      .padding(.horizontal)
  }

  var copyButon: some View {
    Centered {
      Button {
        copy(code: code)
      } label: {
        HStack {
          Icon.copy
          Text(L10n.copyCode)
        }
      }
      .toAny()
    }
  }

  func copy(code: String) {
    UIPasteboard.general.string = code
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      UIAccessibility.post(notification: .announcement, argument: L10n.codeCopied)
    }
  }
}
