// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Additional cost
  internal static let additionalCost = L10n.tr("Localizable", "additionalCost")
  ///  See more on Apple's documentation for "%@"
  internal static func appleDoc(_ p1: Any) -> String {
    return L10n.tr("Localizable", "appleDoc", String(describing: p1))
  }
  /// Back to Index
  internal static let backToIndex = L10n.tr("Localizable", "backToIndex")
  /// Bold text
  internal static let boldText = L10n.tr("Localizable", "boldText")
  /// Tap twice to copy
  internal static let doubleTapToCopy = L10n.tr("Localizable", "doubleTapToCopy")
  /// Early access
  internal static let earlyAccess = L10n.tr("Localizable", "earlyAccess")
  /// Extra bureaucracy
  internal static let extraBureaucracy = L10n.tr("Localizable", "extraBureaucracy")
  /// Free shipping
  internal static let freeShipping = L10n.tr("Localizable", "freeShipping")
  /// Go play it!
  internal static let goPlay = L10n.tr("Localizable", "goPlay")
  /// Handbook
  internal static let handbook = L10n.tr("Localizable", "handbook")
  /// More on Wikipedia
  internal static let moreOnWikipedia = L10n.tr("Localizable", "moreOnWikipedia")
  /// Next page %@
  internal static func nextPage(_ p1: Any) -> String {
    return L10n.tr("Localizable", "nextPage", String(describing: p1))
  }
  /// Regular text
  internal static let regularText = L10n.tr("Localizable", "regularText")
  /// Accessibility Handbook
  internal static let title = L10n.tr("Localizable", "title")

  internal enum AboutColors {
    /// Some people don't experience them at all!
    internal static let comment1 = L10n.tr("Localizable", "AboutColors.comment1")
    /// I'm over extending myself into physics and biology, but bear with me.
    internal static let comment2 = L10n.tr("Localizable", "AboutColors.comment2")
    /// If you don't have a designer there... Well, I hope this content also helps you understand a little bit more about it!
    internal static let comment3 = L10n.tr("Localizable", "AboutColors.comment3")
    /// Human Interface Guidelines - Colors
    internal static let higColors = L10n.tr("Localizable", "AboutColors.higColors")
    /// Image of pretty colors
    internal static let image = L10n.tr("Localizable", "AboutColors.image")
    /// I like colors.\nBut not everybody experience them in the same way.
    internal static let text1 = L10n.tr("Localizable", "AboutColors.text1")
    /// Colors are how our brains make sense of the light that reach our eyes. We have cells that will interact with different frequencies of light, and their combination will produce what we see.
    internal static let text2 = L10n.tr("Localizable", "AboutColors.text2")
    /// And when building an app, colors are usually something that come before actually programming anything, or during what I like to call 'The design step'.
    internal static let text3 = L10n.tr("Localizable", "AboutColors.text3")
    /// So, if you are working on a team with a Designer, I highly recommend you bring these discussion to them. Understanding more about colors, how they affect the users and what we can consider accessibility while handling colors on our app.
    internal static let text4 = L10n.tr("Localizable", "AboutColors.text4")
    /// About Colors
    internal static let title = L10n.tr("Localizable", "AboutColors.title")
  }

  internal enum AboutTheApp {
    /// About the app
    internal static let title = L10n.tr("Localizable", "AboutTheApp.title")
    internal enum Disclaimer {
      /// And I have sure learned a lot while developing this very own app!
      internal static let comment1 = L10n.tr("Localizable", "AboutTheApp.Disclaimer.comment1")
      /// Check the Collaboration page to see more ways to report issues and to help the app's development!
      internal static let openCollaborationPage = L10n.tr("Localizable", "AboutTheApp.Disclaimer.openCollaborationPage")
      /// This app and it's content is supposed to be a helpful guide, based on real development experiences.
      internal static let text1 = L10n.tr("Localizable", "AboutTheApp.Disclaimer.text1")
      /// I do not know EVERYTHING about accessibility, and I'm learning a little bit more every day.
      internal static let text2 = L10n.tr("Localizable", "AboutTheApp.Disclaimer.text2")
      /// It may have some mistakes or misconceptions, so please, consider reporting if you find any of those.
      internal static let text3 = L10n.tr("Localizable", "AboutTheApp.Disclaimer.text3")
      /// I want it to be a reliable tool that can be cosulted during everyday development.
      internal static let text4 = L10n.tr("Localizable", "AboutTheApp.Disclaimer.text4")
      /// Disclaimer
      internal static let title = L10n.tr("Localizable", "AboutTheApp.Disclaimer.title")
    }
    internal enum Game {
      /// The puzzles are not supposed to be hard, thay are just a nice way to practice your accessibility knowledge!
      internal static let comment = L10n.tr("Localizable", "AboutTheApp.Game.comment")
      /// The Handbook was pretty nice and all... but it was a little boring.
      internal static let text1 = L10n.tr("Localizable", "AboutTheApp.Game.text1")
      /// So I tryied to make something that would be nicer to use and to learn,
      internal static let text2 = L10n.tr("Localizable", "AboutTheApp.Game.text2")
      /// And what best way to do that than with a game?
      internal static let text3 = L10n.tr("Localizable", "AboutTheApp.Game.text3")
      /// What about the Game?
      internal static let title = L10n.tr("Localizable", "AboutTheApp.Game.title")
    }
    internal enum History {
      /// The Accessibility Handbook started as an idea with some colleagues and friends, aiming to be an easy way to learn more about iOS accessibility features.
      internal static let text1 = L10n.tr("Localizable", "AboutTheApp.History.text1")
      /// At the time we started working on it, but we never got to finish or publish the Handbook. So, a while later, I took what I learned and decided to bring it into the world! Rewriting the contents, adding UIKit and SwiftUI versions to make something really fresh and nice.
      internal static let text2 = L10n.tr("Localizable", "AboutTheApp.History.text2")
      /// I always thought the information about accessibility was always there, but you had to know what to look for.
      internal static let text3 = L10n.tr("Localizable", "AboutTheApp.History.text3")
      /// That's where this handbook comes, it's something that can be collaborative, easy to use, and fast to find! It's an app! You can carry it around with you and read anytime.
      internal static let text4 = L10n.tr("Localizable", "AboutTheApp.History.text4")
      /// It's mostly based on my experiences as a developer, with real-life examples that (I hope) will help you understand more about Accessibility and also help you use in your own projects!
      internal static let text5 = L10n.tr("Localizable", "AboutTheApp.History.text5")
    }
  }

  internal enum AccElem {
    /// It's important to set elements that should not be focused, such as separators or other elements without accessibility labels, to not be focused.
    internal static let comment = L10n.tr("Localizable", "AccElem.comment")
    /// This way we prevent empty content, that could confuse the user, to be focused
    internal static let comment2 = L10n.tr("Localizable", "AccElem.comment2")
    /// When using the Voice-Over, the cursor will focus on 'accessible' elements. These elements are identified by having the property accessibility element as 'True'.
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
    /// 10 Kilograms
    internal static let accessibilityLabelExample = L10n.tr("Localizable", "AccLabel.accessibilityLabelExample")
    /// Some components automatically set their accesibility label when created, such as Texts or Buttons, but you can manually set it if necessary.
    internal static let comment = L10n.tr("Localizable", "AccLabel.comment")
    /// 10Kg
    internal static let example = L10n.tr("Localizable", "AccLabel.example")
    /// Starry Night, by Vincent Van Gogh. This is an accessibility label!
    internal static let image = L10n.tr("Localizable", "AccLabel.image")
    /// Accessibility labels are the content that is going to be read by the Voice-over when the item is focused.
    internal static let text1 = L10n.tr("Localizable", "AccLabel.text1")
    /// Every element that is focused by the Voice-Over should have an accessibility label.
    internal static let text2 = L10n.tr("Localizable", "AccLabel.text2")
    /// Turn on the Voice-Over and focus on the following element. The content read is it's accessibility label.
    internal static let text3 = L10n.tr("Localizable", "AccLabel.text3")
    /// And, sometimes, you can set a different accessibility label to a view, so its easier to understand its content, like describing measurement units or abreviations.
    internal static let text4 = L10n.tr("Localizable", "AccLabel.text4")
    /// Accessibility Label
    internal static let title = L10n.tr("Localizable", "AccLabel.title")
  }

  internal enum Collaboration {
    /// Check our GitHub project!
    internal static let githubPreoject = L10n.tr("Localizable", "Collaboration.githubPreoject")
    /// License
    internal static let license = L10n.tr("Localizable", "Collaboration.license")
    /// Submit a feature request!
    internal static let submitFeatureRequest = L10n.tr("Localizable", "Collaboration.submitFeatureRequest")
    /// Submit an issue report!
    internal static let submitIssue = L10n.tr("Localizable", "Collaboration.submitIssue")
    /// Submit a Pull Request with the changes!
    internal static let submitPR = L10n.tr("Localizable", "Collaboration.submitPR")
    /// Collaboration
    internal static let title = L10n.tr("Localizable", "Collaboration.title")
    internal enum Issue {
      /// Report to us on our GitHub project!
      internal static let text1 = L10n.tr("Localizable", "Collaboration.Issue.text1")
      /// It could be some translation problem, some accessibility issue (nobody's perfect, okay?), or anything at all!
      internal static let text2 = L10n.tr("Localizable", "Collaboration.Issue.text2")
      /// Found an issue?
      internal static let title = L10n.tr("Localizable", "Collaboration.Issue.title")
    }
    internal enum OpenSource {
      /// It's not perfect, and it's a little weird in some places... I know that, ok?
      internal static let comment1 = L10n.tr("Localizable", "Collaboration.OpenSource.comment1")
      /// Yep, the Handbook is an Open Source project!
      internal static let text1 = L10n.tr("Localizable", "Collaboration.OpenSource.text1")
      /// The idea is that the app's code can be used as examples. Take a look into the code,
      internal static let text2 = L10n.tr("Localizable", "Collaboration.OpenSource.text2")
      /// But fell free to suggest changes, fix some bugs and identify issues on our GitHub project!
      internal static let text3 = L10n.tr("Localizable", "Collaboration.OpenSource.text3")
      /// OpenSource
      internal static let title = L10n.tr("Localizable", "Collaboration.OpenSource.title")
    }
    internal enum Suggestion {
      /// Maybe you have something that you wanted to know that is not present on the app
      internal static let text1 = L10n.tr("Localizable", "Collaboration.Suggestion.text1")
      /// Or you'd like to suggest a new puzzle to add to the games.
      internal static let text2 = L10n.tr("Localizable", "Collaboration.Suggestion.text2")
      /// Fell free to tell us ay idea you have!
      internal static let text3 = L10n.tr("Localizable", "Collaboration.Suggestion.text3")
      /// Want to see something specific?
      internal static let title = L10n.tr("Localizable", "Collaboration.Suggestion.title")
    }
    internal enum Translate {
      /// It's a lot of stuff... I know, but the more the merrier!
      internal static let comment = L10n.tr("Localizable", "Collaboration.Translate.comment")
      /// If you are a developer and would like to bring the handbook closer to your community and your peers, consider helping us translating the app to other languages!
      internal static let text1 = L10n.tr("Localizable", "Collaboration.Translate.text1")
      /// You can get the project on GitHub and open a Pull Requets translating the content!
      internal static let text2 = L10n.tr("Localizable", "Collaboration.Translate.text2")
      /// Help us translate
      internal static let title = L10n.tr("Localizable", "Collaboration.Translate.title")
    }
  }

  internal enum ColorBlind {
    /// Color Blindness
    internal static let title = L10n.tr("Localizable", "ColorBlind.title")
    internal enum About {
      /// These above are examples of an Ishihara test. For a 'normal' vision person, it's expected to see '12', '6' and '74' respectively.
      internal static let comment = L10n.tr("Localizable", "ColorBlind.About.comment")
      /// Example of ishihara color identifying test.
      internal static let ishihara = L10n.tr("Localizable", "ColorBlind.About.ishihara")
      /// Ishihara Test
      internal static let ishiharaTest = L10n.tr("Localizable", "ColorBlind.About.ishiharaTest")
      /// Color blindness is a decreased ability to see color differences.
      internal static let text1 = L10n.tr("Localizable", "ColorBlind.About.text1")
      /// What you may not know is that there are 'levels' of color blindness. A person with green color deficiency, for example, may not see the green color at all, or may see it a little bit less that a non-color-blind person.
      internal static let text2 = L10n.tr("Localizable", "ColorBlind.About.text2")
      /// You may take an Ishihara test to check if you are color blind. I have a friend who discovered she was color blind when we were in college! And before that, I'd expect you to identify this condition much earlier in life.
      internal static let text3 = L10n.tr("Localizable", "ColorBlind.About.text3")
      /// But how does this affect our work when we are building an app?
      internal static let text4 = L10n.tr("Localizable", "ColorBlind.About.text4")
    }
    internal enum Handle {
      /// Using + and - may have cultural connotations, so it may not be the best example here. But it's just an example.
      internal static let comment1 = L10n.tr("Localizable", "ColorBlind.Handle.comment1")
      /// If you do rely on colors only on some part of your app, don't want to change it, but still want to to make it usable for colorblind users, check our 'Differentiate without colors' page.
      internal static let comment2 = L10n.tr("Localizable", "ColorBlind.Handle.comment2")
      /// First, make sure your content does not rely on colors only to take any actions or to identify informations. Take the example below.
      internal static let text1 = L10n.tr("Localizable", "ColorBlind.Handle.text1")
      /// Here, on the first column, we are color coding red the negative items and green the positive ones. But that's exactly what we want to avoid. The second Colum has a much better 'universal' experience where identifying these items as positive or negative does not rely solely on color.
      internal static let text2 = L10n.tr("Localizable", "ColorBlind.Handle.text2")
      /// Handling content considering colorblindness
      internal static let title = L10n.tr("Localizable", "ColorBlind.Handle.title")
    }
    internal enum Images {
      /// First, make sure to add an accessibility label to this image!
      internal static let comment = L10n.tr("Localizable", "ColorBlind.Images.comment")
      /// Sometimes we render content with images. Banners loaded from Backend, some promotional stuff, or just something that looks nicer on the image render.
      internal static let text1 = L10n.tr("Localizable", "ColorBlind.Images.text1")
      /// You also need to be careful to not have content ot be read on conflicting colors for color blindness.
      internal static let text2 = L10n.tr("Localizable", "ColorBlind.Images.text2")
      /// Careful with images
      internal static let title = L10n.tr("Localizable", "ColorBlind.Images.title")
    }
  }

  internal enum ColorsGuide {
    /// Introduction
    internal static let introduction = L10n.tr("Localizable", "ColorsGuide.introduction")
    /// Colors Guide
    internal static let title = L10n.tr("Localizable", "ColorsGuide.title")
  }

  internal enum Contrast {
    /// But why talk about contrast on an accessibility context?
    internal static let comment1 = L10n.tr("Localizable", "Contrast.comment1")
    /// But is also depends on the font itself, the font's weight...
    internal static let comment2 = L10n.tr("Localizable", "Contrast.comment2")
    /// Contrast is the difference in luminance or colour that makes an object (or its representation in an image or display) distinguishable.
    internal static let text1 = L10n.tr("Localizable", "Contrast.text1")
    /// Contrast is important when taking colors on your applications. Everything that should be visible should be well... Visible.
    internal static let text2 = L10n.tr("Localizable", "Contrast.text2")
    /// By that I mean you should be areful when adding colored text on top of colored backgrounds. The base good contrast is black-on-white (or white-on-black) text.
    internal static let text3 = L10n.tr("Localizable", "Contrast.text3")
    /// Contrast
    internal static let title = L10n.tr("Localizable", "Contrast.title")
    internal enum Example {
      /// WCAG stands for 'Web Content Accessibility Guidelines', and I know it's more directed to web, not mobile environments, but that's also nice to take a look into, specially if you are interested in learning more about contarst in accessibility.
      internal static let comment1 = L10n.tr("Localizable", "Contrast.Example.comment1")
      /// This example above fails the WCAG test for contrast.
      internal static let example1 = L10n.tr("Localizable", "Contrast.Example.example1")
      /// This one does kida ok, so you can use this color combination with larger fonts.
      internal static let example2 = L10n.tr("Localizable", "Contrast.Example.example2")
      /// And this one is pretty good! The classics.
      internal static let example3 = L10n.tr("Localizable", "Contrast.Example.example3")
      /// You can try for yourself on this contrast check tool!
      internal static let link = L10n.tr("Localizable", "Contrast.Example.link")
      /// A nice way to test for contrast is using the WCAG contrast guide
      internal static let text1 = L10n.tr("Localizable", "Contrast.Example.text1")
    }
  }

  internal enum Differentiate {
    /// Differentiate without colors
    internal static let title = L10n.tr("Localizable", "Differentiate.title")
  }

  internal enum ElementReadingOrder {
    /// Element reading order
    internal static let title = L10n.tr("Localizable", "ElementReadingOrder.title")
  }

  internal enum Navigation {
    /// This entire app was built to be used with the Voice-Over enabled, the concept described on the pages will always be followed by an example so you can try them by yourself!
    internal static let comment = L10n.tr("Localizable", "Navigation.comment")
    /// On top is an example of the cursor. The title 'Handbook' is currently focused on the image.
    internal static let image = L10n.tr("Localizable", "Navigation.image")
    /// Example image of the Voice-Over running on an iOS device.
    internal static let imageSubtitle = L10n.tr("Localizable", "Navigation.imageSubtitle")
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
