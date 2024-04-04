//
//  TextStyle.swift
//  AnimationsRive
//
//  Created by Silvia España Gil on 4/4/24.
//

import SwiftUI

enum TextStyle {
    
    case largeTitle
    case title
    case title2
    case title3
    case body
    case subheadline
    case footnote
    case caption
    case headline
    case subheadline2
    case footnote2
    case caption2
    
    var name: String {
        switch self {
        case .title, .largeTitle, .title2, .title3:
            return "Poppins Bold"
        case .body, .subheadline, .footnote, .caption:
            return "Inter Regular"
        case .headline, .subheadline2, .footnote2, .caption2:
            return "Inter SemiBold"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .largeTitle:
            40
        case .title:
            28
        case .title2:
            24
        case .title3:
            20
        case .body:
            17
        case .subheadline:
            17
        case .footnote:
            15
        case .caption:
            15
        case .headline:
            13
        case .subheadline2:
            13
        case .footnote2:
            12
        case .caption2:
            12
        }
    }
    
    var relative: Font.TextStyle {
        switch self {
        case .largeTitle:
            return .largeTitle
        case .title:
            return .title
        case .title2:
            return .title2
        case .title3:
            return .title3
        case .body:
            return .body
        case .subheadline:
            return .subheadline
        case .footnote:
            return .footnote
        case .caption:
            return .caption
        case .headline:
            return .headline
        case .subheadline2:
            return .subheadline
        case .footnote2:
            return .footnote
        case .caption2:
            return .caption2
        }
    }
}
