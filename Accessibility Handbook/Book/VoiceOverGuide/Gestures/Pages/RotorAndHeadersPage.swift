//
//  RotorAndHeaders.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 21/09/22.
//

import SwiftUI

struct RotorAndHeadersPage: View, Page {
  var title: String = "Rotor and Headers"

  var body: some View {
    PageContent(next: nil) {
      Group {
        rotor
        header
        together
        example
      }
      .toAny()
    }
  }

  private var rotor: some View {
    Group {
      Title("Rotor")
      Text("If you haven't seen it yet, check our Rotor page to learn more about this component!")
      InternalLink(page: RotorPage().page, title: "Rotor")
    }
  }

  private var header: some View {
    Group {
      Title("Header Trait")
      Text("The accessibility trait 'header' is important to mark the beggining of a new content section, but also its important to notice how it affects the user's navigation with the Rotor.")
      Text("If you haven't seen the 'Header Trait page', take a look to leanr more about it!")
      InternalLink(page: HeaderTraitPage().page, title: "Header Trait")
    }
  }

  private var together: some View {
    Group {
      Title("What about them together?")
      Text("If you enable the rotor, you may notice it has the 'Header' options")
      Text("When selected, this option will allow you to navigate only on headers by swiping up and down on your device.")
      Text("This is extremely useful to find specific content among many other things.")
    }
  }

  private var example: some View {
    Group {
      Title("Example")
      Text("If you haven't noticed, this page was built using some headers!")
      Text("Turn on the Voice-Over and try to navigate only on them!")
    }
  }
}

