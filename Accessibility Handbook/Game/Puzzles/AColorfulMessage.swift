//
//  AColorfulMessage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct AColorfulMessage: GamePage, View {
  var title: String = "A 'Colorful' Message"
  var completed: Bool { GameStates.aColorfulMessageCompleted }

  let hintPage: AnyView = DifferentiateWithoutColorsPage().page

  @State var success: Bool = false
  @State var hinting: Bool = false

  @State private var word: String = ""
  @State private var isDifferentiateWithoutColorEnabled: Bool = UIAccessibility.shouldDifferentiateWithoutColor
  @FocusState private var fieldIsFocused: Bool

  private var hasFigurePassword: Bool {
    word.lowercased() == "226435"
  }

  var body: some View {
    GameContent(success: $success, hinting: $hinting) {
      Group {
        Text("Type in the correct password!")
        Comment("It is a 6 digit password")
        VerticalSpace(.large)
        HStack {
          leftColumn
          Spacer()
          rightColumn
        }
        VerticalSpace(.large)
        TextField("Password", text: $word)
          .keyboardType(.numberPad)
          .focused($fieldIsFocused)
          .padding()
          .background(Color.secondaryBackground)
      }
      .toAny()
    } link: {
      hintPage
    }
    .onAppear {
      NotificationCenter.default.addObserver(forName: UIAccessibility.differentiateWithoutColorDidChangeNotification, object: nil, queue: nil) { _ in
        isDifferentiateWithoutColorEnabled = UIAccessibility.shouldDifferentiateWithoutColor
      }
    }.onChange(of: hasFigurePassword) { newValue in
      success = hasFigurePassword
      guard hasFigurePassword else { return }
      GameStates.aColorfulMessageCompleted = true
    }.onTapGesture {
      fieldIsFocused = false
    }
  }
}

private extension AColorfulMessage {
  var leftColumn: some View {
    VStack(alignment: .leading, spacing: .regular) {
      leftItem(title: "1º ", icon: "triangle.fill")
      leftItem(title: "2º ", icon: "triangle.fill")
      leftItem(title: "3º ", icon: "pentagon.fill")
      leftItem(title: "4º ", icon: "rhombus.fill")
      leftItem(title: "5º ", icon: "seal.fill")
      leftItem(title: "6º ", icon: "rectangle.roundedbottom.fill")
    }
    .foregroundColor(.purple)
    .font(.body.bold())
  }

  var rightColumn: some View {
    VStack(alignment: .trailing, spacing: .regular) {
      rightItem(title: " 1", icon: "square.fill")
      rightItem(title: " 2", icon: "triangle.fill")
      rightItem(title: " 3", icon: "seal.fill")
      rightItem(title: " 4", icon: "rhombus.fill")
      rightItem(title: " 5", icon: "rectangle.roundedbottom.fill")
      rightItem(title: " 6", icon: "pentagon.fill")
    }
    .foregroundColor(.purple)
    .font(.body.bold())
  }

  @ViewBuilder
  func leftItem(title: String, icon: String) -> some View {
    (Text("\(title) ") + Text(isDifferentiateWithoutColorEnabled ? Image(systemName: icon) : Asset.empty.swiftUIImage))
  }

  @ViewBuilder
  func rightItem(title: String, icon: String) -> some View {
    (Text(isDifferentiateWithoutColorEnabled ? Image(systemName: icon) : Asset.empty.swiftUIImage) + Text("\(title) "))
  }
}
