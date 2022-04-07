//
//  ScreenMarkdownBuilder.swift
//
//
//  Created by Leif on 4/6/22.
//

import ScreenData

extension SomeScreen: MarkdownBuildable {
    public var markdown: String {
        var markdown = "# \(title)"
        
        if let headerView = headerView { markdown.append("\n" + headerView.markdown) }
        
        markdown.append("\n" + someView.markdown)
        
        if let footerView = footerView { markdown.append("\n" + footerView.markdown) }
        
        return markdown
    }
}
