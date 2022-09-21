//
//  ColaborationView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct CollaborationView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: .regular) {
        openSource
        VerticalSpace(.regular)
        foundAnIssue
        VerticalSpace(.regular)
        helpUsTranslate
      }.padding()
    }
    .navigationTitle("Collaborate")
  }

  private var openSource: some View {
    Group {
      Title("Open source")
      Text("Yep, the Handbook is an Open Source project!")
      Text("Fell free to suggest changes, fix some bugs, identify issues on our GitHub project!")
    }
  }

  private var foundAnIssue: some View {
    Group {
      Title("Found an issue?")
      Text("Report to us on our GitHub project any issues you find!")
      Text("It could be some translation problem, some accessibility issue (nobody's perfect, okay?), or anything at all!")
    }
  }

  private var helpUsTranslate: some View {
    Group {
      Title("Help us Translate")
      Text("If you are a developer and would like to bring the handbook closer to your community and your peers, consider helping us translating the app to other languages!")
      Text("You can get the project on GitHub and open a Pull Requets translating the content!")
      Comment("It's a lot of stuff... I know, but the more the merrier!")
    }
  }
}
