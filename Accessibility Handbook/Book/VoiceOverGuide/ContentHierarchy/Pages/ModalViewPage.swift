//
//  ModalViewPage.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 22/09/22.
//

import SwiftUI

struct ModalViewPage: View, Page {
  var title: String = "Modal Views"

  let link: String = """
  https://developer.apple.com/documentation/objectivec/nsobject/1615089-accessibilityviewismodal
  """

  @State private var badModalExample: Bool = false
  @State private var goodModalExample: Bool = false

  @AccessibilityFocusState
  private var isGoodModalFocused: Bool

  var body: some View {
    ZStack {
      PageContent(next: GroupingPage()) {
        Group {
          intro
          uiKit
          swiftUI
          example
          footNote
          DocButton(link: link, title: title)
        }
        .toAny()
      }

      if badModalExample {
        badModal
      }

      if goodModalExample {
        goodModal
      }
    }
  }

  private var intro: some View {
    Group {
      Text("Modal Views, in this case, we are talking about any view that is displayed on top of existing content. Banners, toasts, floating buttons...")
      Text("The problem is: The Voice-Over will try to use the language's Natural reading directions to read the content, and even if your view is on top of every other view, the Voice-Over will still focus on the content behind it.")
      InternalLink(page: ElementReadingOrderPage().page, title: "Read more on reading order.")
      Text("To prevent this issue, we can mark a view as being a 'Modal'. This will make the Voice-Over focus only on that view while it's being presented.")
      Comment("But handling Modals has some differences in UIKit and SwiftUI, so I'm splitting into a section for each one here.")
      VerticalSpace(.regular)
    }
  }

  private var uiKit: some View {
    Group {
      Title("UIKit")
      Text("On UIKit, every UIView has the property 'accessibilityViewIsModal'. And we need to set it to 'True' if we want to mark a view as being a modal.")
      Text("But, on my experience, I find that simply setting it to 'True' sometimes does not have the expected behavior.")

      Code(
        uiKit: """
        myView.accessibilityViewIsModal = true
        """
      )

      Text("I suggest overriding this property omn the Modal View's class, and set it to the correct value.")

      Code(
        uiKit: """
        class MyView: UIView {
          var isBeingDisplayed: Bool = true
          override var accessibilityViewIsModal: Bool {
            isBeingDisplayed
          }
        }
        """
      )
      VerticalSpace(.regular)
    }
  }

  private var swiftUI: some View {
    Group {
      Title("SwiftUI")
      Text("On SwiftUI the 'Modal' can be set as it was an accessibility trait.")

      Code(
        swiftUI: """
        .accessibilityAddTraits(.isModal)
        """
      )
      VerticalSpace(.regular)
    }
  }

  private var example: some View {
    Group {
      Title("Examples")
      Text("Turn the Voice-Over on and test the modals below.")

      Centered {
        Group {
          Button {
            badModalExample = true

            UIAccessibility.post(notification: .screenChanged, argument: nil)
          } label: {
            Text("Bad modal")
              .font(.callout.bold())
          }
          HorizontalSpace(.large)
          Button {
            goodModalExample = true
            isGoodModalFocused = true

            UIAccessibility.post(notification: .screenChanged, argument: nil)
          } label: {
            Text("Good modal")
              .font(.callout.bold())
          }
        }
        .toAny()
      }
    }
  }

  private var footNote: some View {
    Group {
      Comment("Noticed that when opening the good modal, the cursor focused directly on it? It is important when displaying a modal on top of existing content that we do that.")
      InternalLink(page: ChangeCursorPositionPage().page, title: "Learn more about it on the Notifications section.")
    }
  }

  private var badModal: some View {
    ZStack {
      modalBackground
      VStack(spacing: .regular) {
        Title("Modal")
        Text("This is a Bad Modal")
        Button {
          badModalExample = false
        } label: {
          Text("Dismiss")
            .font(.callout.bold())
        }
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }

  private var goodModal: some View {
    ZStack {
      modalBackground
      VStack(spacing: .regular) {
        Title("Modal")
          .accessibilityFocused($isGoodModalFocused)
        Text("This is a Good Modal")
        Button {
          goodModalExample = false
        } label: {
          Text("Dismiss")
            .font(.callout.bold())
        }
      }
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
      .accessibilityAddTraits([.isModal])
    }
  }

  private var modalBackground: some View {
    Rectangle()
      .background(.thinMaterial)
      .foregroundColor(.clear)
  }
}
