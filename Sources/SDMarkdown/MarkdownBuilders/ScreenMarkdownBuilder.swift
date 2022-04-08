//
//  ScreenMarkdownBuilder.swift
//
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public extension SomeScreen {
    init(
        title: String,
        headerView: SomeView? = nil,
        someView: SomeView,
        footerView: SomeView? = nil
    ) {
        self.init(
            id: nil,
            title: title,
            backgroundColor: SomeColor(red: 0, green: 0, blue: 0),
            headerView: headerView,
            someView: someView,
            footerView: footerView
        )
    }
}

extension SomeScreen: MarkdownBuildable {
    public var markdown: String {
        var markdown = "# \(title)"
        
        if let headerView = headerView { markdown.append("\n" + headerView.markdown) }
        
        markdown.append("\n" + someView.markdown)
        
        if let footerView = footerView { markdown.append("\n" + footerView.markdown) }
        
        return markdown
    }
}
