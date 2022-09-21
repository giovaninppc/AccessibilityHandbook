// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  ///  See more on Apple's documentation for "%@"
  internal static func appleDoc(_ p1: Any) -> String {
    return L10n.tr("Localizable", "appleDoc", String(describing: p1))
  }
  /// Back to Index
  internal static let backToIndex = L10n.tr("Localizable", "backToIndex")
  /// Tap twice to copy
  internal static let doubleTapToCopy = L10n.tr("Localizable", "doubleTapToCopy")
  /// Handbook
  internal static let handbook = L10n.tr("Localizable", "handbook")
  /// Next page %@
  internal static func nextPage(_ p1: Any) -> String {
    return L10n.tr("Localizable", "nextPage", String(describing: p1))
  }
  /// Accessibility Handbook
  internal static let title = L10n.tr("Localizable", "title")

  internal enum AccElem {
    /// It's important to set elements that should not be focused, such as separators or other elements without accessibility labels, to not be focused.
    internal static let comment = L10n.tr("Localizable", "AccElem.comment")
    /// This way we prevent empty content, that could confuse the user, to be focused
    internal static let comment2 = L10n.tr("Localizable", "AccElem.comment2")
    /// When using the Voice-Over, the cursor will focus on 'accessibile' elements. These elements are identified by having the property accessibility element as 'True'.
    internal static let text1 = L10n.tr("Localizable", "AccElem.text1")
    /// Every element marked with this property 'True' can be focused by the Voice-Over, and the elments with the property 'False' will be ignored.
    internal static let text2 = L10n.tr("Localizable", "AccElem.text2")
    /// Turn the Voice-Over on and navigate through the next elements. Some will not be focused by it.
    internal static let text3 = L10n.tr("Localizable", "AccElem.text3")
    /// Accessibility Element
    internal static let title = L10n.tr("Localizable", "AccElem.title")
    internal enum Example {
      /// This is an accessibility element.
      internal static let isAccessibilityElement = L10n.tr("Localizable", "AccElem.example.isAccessibilityElement")
    }
  }

  internal enum AccElements {
    /// Accessibility Properties
    internal static let title = L10n.tr("Localizable", "AccElements.title")
  }

  internal enum AccHint {
    /// Hints should be optional to read. They are left as the last element so they can be skiped if the user already knows what to do.
    internal static let comment = L10n.tr("Localizable", "AccHint.comment")
    /// Accessibility hints are additional content read at the end. They are always the last content to be read.
    internal static let text1 = L10n.tr("Localizable", "AccHint.text1")
    /// They are used to provide additional information about a focused item so the user can help better understand how it works.
    internal static let text2 = L10n.tr("Localizable", "AccHint.text2")
    /// For instance: You have a cell with a long press gesture (triple tap with a single finger), you may add a hint to tell the user about this additional action.
    internal static let text3 = L10n.tr("Localizable", "AccHint.text3")
    /// Accessibility Hint
    internal static let title = L10n.tr("Localizable", "AccHint.title")
    internal enum Example {
      /// #123456
      internal static let footer = L10n.tr("Localizable", "AccHint.example.footer")
      /// Tap three times to copy the order code.
      internal static let hint = L10n.tr("Localizable", "AccHint.example.hint")
      /// French fries with cheese
      internal static let message = L10n.tr("Localizable", "AccHint.example.message")
      /// Order code copied to clipboard
      internal static let notification = L10n.tr("Localizable", "AccHint.example.notification")
      /// Your order
      internal static let title = L10n.tr("Localizable", "AccHint.example.title")
    }
  }

  internal enum AccLabel {
    /// Starry Night, by Vincent Van Gogh. This is an accessibility label!
    internal static let image = L10n.tr("Localizable", "AccLabel.image")
    /// Accessibility labels are the content that is going to be read by the Voice-over when the item is focused.
    internal static let text1 = L10n.tr("Localizable", "AccLabel.text1")
    /// Every element that is focused by the Voice-Over should have an accessibility label.
    internal static let text2 = L10n.tr("Localizable", "AccLabel.text2")
    /// Turn on the Voice-Over and focus on the following element. The content read is it's accessibility label.
    internal static let text3 = L10n.tr("Localizable", "AccLabel.text3")
    /// Some components automatically set their accesibility label when created, such as Texts or Buttons, but you can manually set it if necessary.
    internal static let text4 = L10n.tr("Localizable", "AccLabel.text4")
    /// Accessibility Label
    internal static let title = L10n.tr("Localizable", "AccLabel.title")
  }

  internal enum ElementReadingOrder {
    /// Element reading order
    internal static let title = L10n.tr("Localizable", "ElementReadingOrder.title")
  }

  internal enum Navigation {
    /// This entire app was built to be used with the Voice-Over enabled, the concept described on the pages will always be followed by an example so you can try them by yourself!
    internal static let comment = L10n.tr("Localizable", "Navigation.comment")
    /// The Voice-Over navigation is based in gestures. Each gesture, can be perfomed anywhere on the screen, and will trigger a certain action.
    internal static let text1 = L10n.tr("Localizable", "Navigation.text1")
    /// Once enabled, the Voice-Over will display a frame on top of the current view that is being read. This frame is called 'Cursor'.
    internal static let text2 = L10n.tr("Localizable", "Navigation.text2")
    /// To navigate basically means changing the cursor's position, so it will read another element.
    internal static let text3 = L10n.tr("Localizable", "Navigation.text3")
    /// The basic navigation can be done swiping horizontally on the screen to move to cursor to the next or previous element.
    internal static let text4 = L10n.tr("Localizable", "Navigation.text4")
    /// Navigation
    internal static let title = L10n.tr("Localizable", "Navigation.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
