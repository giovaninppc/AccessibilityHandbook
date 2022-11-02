//
//  RotorPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct RotorPage: View, Page {
  let title: String = L10n.rotor
  @State private var sheet: Bool = false

  var body: some View {
    PageContent(next: RotorAndHeadersPage(), deeplink: deeplink) {
      Group {
        intro
        example
        content
      }
      .toAny()
    }
    .sheet(isPresented: $sheet, onDismiss: {
      sheet = false
    }, content: {
      RotorExampleView()
    })
  }
}

private extension RotorPage {
  @ViewBuilder
  var intro: some View {
    Comment(L10n.Rotor.comment1)
    Text(L10n.Rotor.text1)
    Comment(L10n.Rotor.comment2)
  }

  @ViewBuilder
  var content: some View {
    Text(L10n.Rotor.text2)
    Text(L10n.Rotor.text3)
    code
    Comment(L10n.Rotor.comment3)
    Button {
      sheet = true
    } label: {
      Text("Check the example")
    }

    DocButton(
      link: "https://developer.apple.com/documentation/objectivec/nsobject/1649788-accessibilitycustomrotors",
      title: title
    )
  }

  @ViewBuilder
  var code: some View {
    Code.uikit(
      """
      accessibilityCustomRotors = UIAccessibilityCustomRotor()
      """
    )
    Code.swiftUI(
      """
      @Namespace
      var customRotorNamespace

      var body: some View {
        Stack {
        View()
          .accessibilityRotorEntry(
            id: id,
            in: customRotorNamespace
          )
        }
        .accessibilityRotor("Rotor item name") {
          AccessibilityRotorEntry(
            "message",
            id: id,
            in: customRotorNamespace
          )
        }
      }
      """
    )
  }

  @ViewBuilder
  var example: some View {
    VerticalSpace(.regular)
    HStack {
      Spacer()
      Image(uiImage: Asset.rotor.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100.0, height: 100.0)
        .accessibilityAddTraits([.isImage])
        .accessibilityLabel(L10n.Rotor.image)
      Spacer()
    }
    VerticalSpace(.regular)
  }
}

fileprivate struct RotorExampleView: View {
  enum Value: Identifiable {
    case icon(Image, String)
    case text(String)
    case notes(String)

    var id: String {
      switch self {
      case .notes(let value), .text(let value):
        return .init(value)
      case .icon(_, let label):
        return .init(label)
      }
    }
  }

  @Namespace
  private var customRotorNamespace

  private let content: [Value] = [
    .text("A"),
    .text("B"),
    .icon(Icon.book, "Livro"),
    .notes("C"),
    .icon(Icon.raisedHands, "Hand"),
    .notes("J"),
    .text("Y")
  ]

  var body: some View {
    ScrollView([.vertical], showsIndicators: false) {
      VStack(alignment: .leading, spacing: .regular) {
        Title("Rotor Example")
        Text("Here's a page with a custom rotor example")
        Text("Use the rotor to navigate in the icons on the page")
        Divider()

        ForEach(content) { item in
          switch item {
          case .text(let text):
            Text(text)
              .accessibilityRotorEntry(id: item.id, in: customRotorNamespace)
          case .notes(let note):
            Comment(note)
              .accessibilityRotorEntry(id: item.id, in: customRotorNamespace)
          case .icon(let image, let accLabel):
            image
              .resizable()
              .accessibilityLabel(accLabel)
              .accessibilityRotorEntry(id: item.id, in: customRotorNamespace)
          }
        }
      }
    }
    .accessibilityRotor("Images") {
      ForEach(content) { item in
        if case .icon(_, let label) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
    .accessibilityRotor("Text") {
      ForEach(content) { item in
        if case .text(let label) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
    .accessibilityRotor("Notes") {
      ForEach(content) { item in
        if case .notes(let label) = item {
          AccessibilityRotorEntry(label, item.id, in: customRotorNamespace)
        }
      }
    }
  }
}
