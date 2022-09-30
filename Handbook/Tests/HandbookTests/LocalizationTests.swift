import XCTest

@testable import Handbook

private enum AvailableLanguages: String, CaseIterable {
  case en
  case pt = "pt-BR"

  static func get(numericValue: Int) -> Self {
    switch numericValue {
    case 0:
      return .en
    case 1:
      return .pt
    default:
      return .en
    }
  }
}

final class LocalizationTests: XCTestCase {
  func test_localizableFiles_shouldHaveTheSameQuantityOfStrings() {
    let quantities = AvailableLanguages.allCases.map {
      loadStringKeys(language: $0).count
    }

    XCTAssertEqual(quantities.count, AvailableLanguages.allCases.count)
    XCTAssertTrue(quantities.allSatisfy({ $0 > 0 }))
    XCTAssertTrue(quantities.allSatisfy({ $0 == quantities.first ?? -1 }))
  }

  func test_localizableFiles_shouldHaveTheSameKeysInAllLanguages() throws {
    let listOfKeysForLanguage = AvailableLanguages.allCases.map {
      loadStringKeys(language: $0)
    }

    let baseKeys = try XCTUnwrap(listOfKeysForLanguage.first)
    listOfKeysForLanguage.enumerated().forEach { index, listOfKeys in
      listOfKeys.forEach { key in
        XCTAssertTrue(
          baseKeys.contains(key),
          "Unmatched localized string key \(key) at \(AvailableLanguages.get(numericValue: index)) file"
        )
      }
    }
  }
}

private extension LocalizationTests {
  func loadStringKeys(language: AvailableLanguages, file: StaticString = #file, line: UInt = #line) -> [String] {
    do {
      let file = try getLocalizedContent(language: language)
      return splitIntoStrings(file: file)
    } catch {
      XCTFail(file: file, line: line)
    }
    return []
  }

  func splitIntoStrings(file: String) -> [String] {
    let splits = file.split(separator: "\n").map(String.init)
    let filtered = filterForValidStringLines(strings: splits)
    return filtered.map(getLocalizedKey(from:))
  }

  func filterForValidStringLines(strings: [String]) -> [String] {
    strings.filter { content in
      content.first == "\"" && content.last == ";"
    }
  }

  func getLocalizedKey(from string: String) -> String {
    guard string.contains("=") else { return "" }
    let split = string.split(separator: "=")
    return String(split.first?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "")
  }

  func getLocalizedContent(language: AvailableLanguages) throws -> String {
    guard let filepath = Bundle.module.path(
      forResource: "Localizable",
      ofType: "strings",
      inDirectory: nil,
      forLocalization: language.rawValue
    ) else { throw LocalizationTestsError.unableToLoadStringFile }

    return try String(contentsOfFile: filepath)
  }
}

private enum LocalizationTestsError: Error {
  case unableToLoadStringFile
}
