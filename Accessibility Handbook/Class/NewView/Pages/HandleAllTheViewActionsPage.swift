//
//  HandleAllTheViewActions.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 12/12/22.
//

import SwiftUI

struct HandleAllTheViewActionsPage: View, Page {
  let title: String = L10n.HandleAllActions.title

  @State var currentValue: Int = 0

  @State var counter1: Int = 0
  @State var counter2: Int = 0
  @State var counter3: Int = 0
  @State var counter4: Int = 0
  @State var counter5: Int = 0
  @State var counter6: Int = 0

  var body: some View {
    PageContent(next: ValidateColorsPage(), deeplink: deeplink) {
      Group {
        disclaimer
        intro
        buttonFocus
        customActions
        adjustableElement
        competingActions
        competingActionsExample
        github
      }
      .toAny()
    }
  }
}

private extension HandleAllTheViewActionsPage {
  var disclaimer: some View {
    Disclaimer.beforeYouReadThis(check: L10n.interactrion, destination: IndexView.voiceOverInteractionDeeplink())
  }

  @ViewBuilder
  var intro: some View {
    Text(L10n.HandleAllActions.text1)
    Text(L10n.HandleAllActions.text2)
    Text(L10n.HandleAllActions.text3)
    Comment(L10n.HandleAllActions.comment1)
  }

  @ViewBuilder
  var buttonFocus: some View {
    Title(L10n.HandleAllActions.ButtonFocus.title)
    Text(L10n.HandleAllActions.ButtonFocus.text1)
    Centered {
      buttonFocusHierarchyExample
        .toAny()
    }
    Comment(L10n.PlanBeforeYouImplement.Group.imageExplanation)
  }

  @ViewBuilder
  var customActions: some View {
    Title(L10n.HandleAllActions.CustomActions.title)
    Disclaimer.beforeYouReadThis(check: L10n.CustomActions.title, destination: CustomActionsPage().deeplink)
    Text(L10n.HandleAllActions.CustomActions.text1)
    Text(L10n.HandleAllActions.CustomActions.text2)
    customActionExample
  }

  @ViewBuilder
  var adjustableElement: some View {
    Title(L10n.HandleAllActions.Adjustable.title)
    Disclaimer.beforeYouReadThis(check: L10n.Adjustable.title, destination: AdjustablePage().deeplink)
    Text(L10n.HandleAllActions.Adjustable.text1)
    Text(L10n.HandleAllActions.Adjustable.text2)
    adjustableExample
  }

  @ViewBuilder
  var competingActions: some View {
    Title(L10n.HandleAllActions.CompetingActions.title)
    Text(L10n.HandleAllActions.CompetingActions.text1)
    Text(L10n.HandleAllActions.CompetingActions.text2)
    Text(L10n.HandleAllActions.CompetingActions.text3)
  }

  @ViewBuilder
  var competingActionsExample: some View {
    Centered {
      competingActionsHierarchyExample
        .toAny()
    }
    Text(L10n.HandleAllActions.CompetingActions.text4)
    Text(L10n.HandleAllActions.CompetingActions.text5)
    Text(L10n.HandleAllActions.CompetingActions.text6)
    Text(L10n.HandleAllActions.CompetingActions.text7)
    competingActionCarousel
    Text(L10n.HandleAllActions.CompetingActions.text8)
    Text(L10n.HandleAllActions.CompetingActions.text9)
  }

  @ViewBuilder
  var github: some View {
    Centered {
      competingActionsHierarchyExampleBreakdown
        .toAny()
    }
    Comment(L10n.HandleAllActions.CompetingActions.comment1)
    ExternalLink(
      link: "https://github.com/giovaninppc/AccessibilityHandbook",
      title: L10n.Collaboration.githubPreoject
    )
  }
}

private extension HandleAllTheViewActionsPage {
  var buttonFocusHierarchyExample: some View {
    VStack(spacing: .regular) {
      VStack(spacing: .regular) {
        Text("Title Label")
          .padding()
          .hierarchyBackground()

        Text("Subtitle Label")
          .padding()
          .hierarchyBackground()
      }
      .padding()
      .hierarchyBackground()
      .border(.primary, width: 2.0)

      HStack(spacing: .regular) {
        Text("Edit button")
          .fixedSize(horizontal: false, vertical: true)
          .padding()
          .hierarchyBackground()
          .border(.primary, width: 2.0)

        Text("Save button")
          .fixedSize(horizontal: false, vertical: true)
          .padding()
          .hierarchyBackground()
          .border(.primary, width: 2.0)

        Text("Delete button")
          .fixedSize(horizontal: false, vertical: true)
          .padding()
          .hierarchyBackground()
          .border(.primary, width: 2.0)
      }

      HStack {
        Spacer()
        Text("Base View")
      }
    }
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
    .padding()
    .hierarchyBackground()
    .frame(maxWidth: 350.0)
  }

  var customActionExample: some View {
    Group {
      VerticalSpace(.regular)
      Centered {
        VStack(spacing: .regular) {
          Title(L10n.CustomActions.creditCard)
          Text("**** **** **** 1234")
          HStack(spacing: .regular) {
            Button {
              //
            } label: {
              (Text(Icon.pencil) + Text(String.space) + Text(L10n.select))
            }
            Button {
              //
            } label: {
              (Text(Icon.checkmark) + Text(String.space) + Text(L10n.select))
            }
            Button {
              //
            } label: {
              (Text(Icon.trash) + Text(String.space) + Text(L10n.delete))
            }
          }
        }
        .padding()
        .accessibilityElement(children: .combine)
        .accessibilityLabel(L10n.CustomActions.accessible)
        .accessibilityAction(named: Text(L10n.select)) {
          UIAccessibility.post(notification: .announcement, argument: L10n.selected)
        }
        .accessibilityAction(named: Text(L10n.edit)) {
          UIAccessibility.post(notification: .announcement, argument: L10n.edited)
        }
        .accessibilityAction(named: Text(L10n.delete)) {
          UIAccessibility.post(notification: .announcement, argument: L10n.deleted)
        }
        .background {
          RoundedRectangle(cornerRadius: 8.0)
            .foregroundColor(.secondaryBackground)
        }
        .toAny()
      }
      VerticalSpace(.regular)
    }
  }

  @ViewBuilder
  var adjustableExample: some View {
    VerticalSpace(.regular)
    AdjustableCounter(value: $currentValue)
    VerticalSpace(.regular)
  }

  var competingActionsHierarchyExample: some View {
    VStack {
      ZStack {
        VStack {
          Text("Image")
            .padding(.vertical, 80)
            .hierarchyBackground()
          Text("Title label")
            .padding()
            .hierarchyBackground()
          Text("Description label")
            .padding()
            .hierarchyBackground()
          HStack {
            Spacer()
            Text("Auxiliar view")
          }
        }
        .padding()
        .hierarchyBackground()
        VStack {
          VerticalSpace(.compact)
          HStack {
            Spacer()
            Text("Favorite button")
              .padding()
              .hierarchyBackground()
              .frame(maxWidth: 200.0)
            HorizontalSpace(.compact)
          }
          Spacer()
        }
        .padding()
      }

      VStack {
        HStack {
          Spacer()
          Text("-\nButton")
            .padding()
            .hierarchyBackground()
            .multilineTextAlignment(.center)
          Text("Label")
            .padding()
            .hierarchyBackground()
          Text("+\nButton")
            .padding()
            .hierarchyBackground()
            .multilineTextAlignment(.center)
        }
        HStack {
          Spacer()
          Text("Counter")
        }
      }
      .padding()
      .hierarchyBackground()

      HStack {
        Spacer()
        Text("Base view")
      }
    }
    .padding()
    .hierarchyBackground()
    .frame(maxWidth: 350.0)
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
  }

  var competingActionCarousel: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        competingActionsCell(counter: $counter1, name: "Item 1")
        competingActionsCell(counter: $counter2, name: "Item 2")
        competingActionsCell(counter: $counter3, name: "Item 3")
        competingActionsCell(counter: $counter4, name: "Item 4")
        competingActionsCell(counter: $counter5, name: "Item 5")
        competingActionsCell(counter: $counter6, name: "Item 6")
      }
    }
  }

  func competingActionsCell(counter: Binding<Int>, name: String) -> some View {
    VStack {
      ZStack {
        VStack {
          Asset.starryNight.swiftUIImage
            .resizable()
            .scaledToFill()
            .frame(width: 180.0, height: 100.0)
            .clipped()
          Title(name)
          Text("Item description")
        }
        VStack {
          HStack {
            Spacer()
            Button {
              //
            } label: {
              Icon.heartFill
                .resizable()
                .frame(width: 20.0, height: 20.0)
            }
            .accessibilityHidden(true)
          }
          Spacer()
        }
        .padding()
      }
      .accessibilityElement(children: .combine)
      .accessibilityAddTraits(.isButton)
      .accessibilityAction(named: "Open") {
        //
      }
      .accessibilityAction(named: "Save") {
        //
      }
      AdjustableCounter(value: counter)
        .accessibilityLabel(name + " quantity")
        .accessibilityHidden(false)
    }
    .padding(.bottom)
    .background {
      RoundedRectangle(cornerRadius: 8.0)
        .foregroundColor(.secondaryBackground)
    }
    .frame(width: 180.0)
    .padding()
    .accessibilityElement(children: .contain)
  }

  var competingActionsHierarchyExampleBreakdown: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading) {
        ZStack {
          VStack(alignment: .leading) {
            Text("Image")
              .padding(.vertical, 80)
              .hierarchyBackground()
            Text("Title label")
              .padding()
              .hierarchyBackground()
            Text("Description label")
              .padding()
              .hierarchyBackground()
            HStack {
              Spacer()
              Text("Auxiliar view")
            }
          }
          .padding()
          .hierarchyBackground()
          VStack(alignment: .leading) {
            VerticalSpace(.compact)
            HStack {
              Spacer()
              Text("Favorite button")
                .padding()
                .hierarchyBackground()
                .frame(maxWidth: 200.0)
              HorizontalSpace(.compact)
            }
            Spacer()
          }
          .padding()
        }
        .border(.primary, width: 2.0)
        Group {
          Text("Children: Combine")
          Text("Trait: Button")
          Text("Custom Actions: Open, Save")
        }
        .font(.caption)

        VStack(alignment: .leading) {
          HStack {
            Spacer()
            Text("-\nButton")
              .padding()
              .hierarchyBackground()
              .multilineTextAlignment(.center)
            Text("Label")
              .padding()
              .hierarchyBackground()
            Text("+\nButton")
              .padding()
              .hierarchyBackground()
              .multilineTextAlignment(.center)
          }
          HStack {
            Spacer()
            Text("Counter")
          }
        }
        .padding()
        .hierarchyBackground()
        .border(.primary, width: 2.0)
        Group {
          Text("Children: Combine")
          Text("Trait: Adjustable")
        }
        .font(.caption)

        HStack {
          Spacer()
          Text("Base view")
        }
      }
      .padding()
      .hierarchyBackground()
      .overlay {
        Rectangle()
          .stroke(.primary, style: StrokeStyle(lineWidth: 2, dash: [10, 5]))
      }
      Group {
        Text("Children: Contain")
        Text("or Should Group accessibility Children: True")
      }
      .font(.caption)
    }
    .frame(maxWidth: 350.0)
    .accessibilityElement(children: .combine)
    .accessibilityHidden(true)
  }
}
