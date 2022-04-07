//
//  LabelMarkdownBuilder.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public extension SomeLabel {
    init(
        title: String,
        subtitle: String? = nil,
        font: FontType = .body,
        destination: Destination? = nil
    ) {
        self.init(
            id: nil,
            title: title,
            subtitle: subtitle,
            font: font,
            style: nil,
            destination: destination
        )
    }
}

extension SomeLabel: MarkdownBuildable {
    public var markdown: String {
        let titleLabel: () -> String = {
            let titleMarkdown: String
            
            if let destination = destination {
                titleMarkdown = "[\(title)](\(destination.toID))"
            } else {
                titleMarkdown = title
            }
            
            switch font {
            case .largeTitle: return "# \(titleMarkdown)"
            case .title: return "## \(titleMarkdown)"
            case .headline: return "### \(titleMarkdown)"
            case .body: return titleMarkdown
            case .footnote: return "*\(titleMarkdown)*"
            case .caption: return "**\(titleMarkdown)**"
            }
        }
        let subtitleLabel: () -> String = {
            guard let subtitle = subtitle else { return "" }
            switch font {
            case .largeTitle: return "\n### \(subtitle)"
            case .title: return "\n#### \(subtitle)"
            case .headline: return "\n##### \(subtitle)"
            case .body: return "\n\(subtitle)"
            case .footnote: return "\n*\(subtitle)*"
            case .caption: return "\n**\(subtitle)**"
            }
        }
        
        return titleLabel() + subtitleLabel()
    }
}
