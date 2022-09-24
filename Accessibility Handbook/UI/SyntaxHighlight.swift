//
//  SyntaxHighlight.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 24/09/22.
//

import SwiftUI

// This is a syntax highlighter based in Regexes.
// And... probably it's not great,
// But we can discuss evolutions on the syntax highlight at.
final class SyntaxHighlight {
  private var text: String = ""
  private var highlighted: NSMutableAttributedString = .init()

  func highlight(code: String) -> AttributedString {
    self.text = code
    self.highlighted = .init(string: code)

    keywords()
    names()
    types()
    numbers()
    subProperties()
    strings()
    comments()

    return AttributedString(highlighted)
  }
}

private extension SyntaxHighlight {
  func keywords() {
    highlight(match: "func ", color: .systemPink, bolded: true)
    highlight(match: "override ", color: .systemPink, bolded: true)
    highlight(match: "return", color: .systemPink, bolded: true)
    highlight(match: "class ", color: .systemPink, bolded: true)
    highlight(match: "struct ", color: .systemPink, bolded: true)
    highlight(match: "let ", color: .systemPink, bolded: true)
    highlight(match: "var ", color: .systemPink, bolded: true)
    highlight(match: "switch ", color: .systemPink, bolded: true)
    highlight(match: "case ", color: .systemPink, bolded: true)
    highlight(match: "true", color: .systemPurple, bolded: true)
    highlight(match: "false", color: .systemPurple, bolded: true)
    highlight(match: "@[A-Za-z]*", color: .systemPink, bolded: true)
  }

  func types() {
    highlight(match: ": [A-Z][A-Za-z]*", color: .systemBlue, bolded: true)
    highlight(match: ":", color: .label, bolded: true)
    highlight(match: "-> [A-Z][A-Za-z]*", color: .systemBlue, bolded: true)
    highlight(match: "->", color: .label, bolded: true)
    highlight(match: "$[A-Za-z]*", color: .systemBlue, bolded: true)
  }

  func numbers() {
    highlight(match: "[ ][0-9]+", color: .systemOrange)
  }

  func names() {
    highlight(match: "[ ][A-Z][A-Za-z]+", color: .systemPurple)
    highlight(match: "^[A-Z][A-Za-z]+", color: .systemPurple)
  }

  func comments() {
    highlight(match: "//.*", color: .systemGreen)
    highlight(match: "/\\*.*\\*/", color: .systemGreen)
  }

  func strings() {
    highlight(match: "\".*\"", color: .systemRed)
  }

  func subProperties() {
    highlight(match: "\\.[A-Za-z]+", color: .systemBlue)
    highlight(match: "\\.", color: .label)
  }

  func highlight(match: String, color: UIColor, bolded: Bool = false) {
    let pattern = match
    let inString = text
    let regex = try? NSRegularExpression(pattern: pattern, options: [])
    let range = NSMakeRange(0, inString.count)
    let matches = (regex?.matches(in: inString, options: [], range: range))!

    for match in matches {
      highlighted.addAttributes([
        .foregroundColor: color,
        .font: UIFont.monospacedSystemFont(ofSize: 16.0, weight: bolded ? .bold : .regular)
      ], range: match.range)
    }
  }
}
