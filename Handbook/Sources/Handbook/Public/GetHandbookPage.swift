//
//  File.swift
//  
//
//  Created by Giovani Nascimento Pereira on 30/09/22.
//

import SwiftUI

public enum GetHandbookPage {
  public static func home() -> some View {
    return HomeView()
  }

  public static func index() -> some View {
    return AccessibilityIndex()
  }
}
