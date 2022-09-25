//
//  ColaborationView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct CollaborationView: View, Page {
  var title: String { L10n.Collaboration.title }

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .regular) {
        openSource
        VerticalSpace(.regular)
        foundAnIssue
        VerticalSpace(.regular)
        helpUsTranslate
        VerticalSpace(.regular)
        suggestions
      }.padding()
    }
    .navigationTitle(title)
  }

  private var openSource: some View {
    Group {
      Title(L10n.Collaboration.OpenSource.title)
      Text(L10n.Collaboration.OpenSource.text1)
      Text(L10n.Collaboration.OpenSource.text2)
      Comment(L10n.Collaboration.OpenSource.comment1)
      Text(L10n.Collaboration.OpenSource.text3)
      ExternalLink(link: "https://github.com/giovaninppc/AccessibilityHandbook", title: L10n.Collaboration.githubPreoject)
      ExternalLink(link: "https://github.com/giovaninppc/AccessibilityHandbook/blob/main/LICENSE", title: L10n.Collaboration.license)
    }
  }

  private var foundAnIssue: some View {
    Group {
      Title(L10n.Collaboration.Issue.title)
      Text(L10n.Collaboration.Issue.text1)
      Text(L10n.Collaboration.Issue.text2)
      ExternalLink(
        link: "https://github.com/giovaninppc/AccessibilityHandbook/issues/new",
        title: L10n.Collaboration.submitIssue
      )
    }
  }

  private var helpUsTranslate: some View {
    Group {
      Title(L10n.Collaboration.Translate.title)
      Text(L10n.Collaboration.Translate.text1)
      Text(L10n.Collaboration.Translate.text2)
      Comment(L10n.Collaboration.Translate.comment)
      ExternalLink(link: "https://github.com/giovaninppc/AccessibilityHandbook/compare", title: L10n.Collaboration.submitPR)
    }
  }

  private var suggestions: some View {
    Group {
      Title(L10n.Collaboration.Suggestion.title)
      Text(L10n.Collaboration.Suggestion.text1)
      Text(L10n.Collaboration.Suggestion.text2)
      Text(L10n.Collaboration.Suggestion.text3)
      ExternalLink(link: "https://github.com/giovaninppc/AccessibilityHandbook/issues/new", title: L10n.Collaboration.submitFeatureRequest)
    }
  }
}
