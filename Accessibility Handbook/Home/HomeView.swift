//
//  HomeView.swift
//  Accessibility Handbook
//
//  Created by Giovani Nascimento Pereira on 20/09/22.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .center, spacing: .large) {
        Spacer()
          .frame(height: .large)
        homeElement(
          icon: .init(systemName: "gamecontroller.fill"),
          title: "The Handbook Game",
          destination: GameView().toAny()
        )
        homeElement(
          icon: .init(systemName: "text.book.closed.fill"),
          title: "Voice-Over Guide",
          destination: IndexView().toAny()
        )
        homeElement(
          icon: .init(systemName: "circle"),
          title: "Colors",
          destination: IndexView().toAny()
        )
      }
    }
    .navigationTitle(L10n.handbook)
    .toolbar {
      NavigationLink {
        //
      } label: {
        Image(systemName: "arrow.up.and.down.and.arrow.left.and.right")
      }
    }
  }

  @ViewBuilder
  private func homeElement(icon: Image, title: String, destination: AnyView) -> some View {
    NavigationLink {
      destination
    } label: {
      VStack {
        Spacer()
        icon
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 50.0, height: 50.0)
        Spacer()
        Text(title)
          .font(.title3)
        Spacer()
      }
      .accessibilityElement(children: .combine)
      .frame(minWidth: 150.0, minHeight: 150.0)
      .padding()
      .background {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(.secondaryBackground)
      }
    }
  }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
