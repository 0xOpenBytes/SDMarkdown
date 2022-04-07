//
//  SDMarkdown.swift
//  
//
//  Created by Leif on 4/6/22.
//

import ScreenData

public struct SDMarkdown {
    public var screens: [SomeScreen]
    
    public init(
        screens: [SomeScreen]
    ) {
        self.screens = screens
    }
    
    public init(
        screens: [SomeScreen],
        customizedMarkdown: [String: SDCustomizedMarkdown],
        markdownBuilder: SomeViewMarkdownBuildable
    ) {
        self.screens = screens
        
        SomeCustomView.customizedMarkdown = customizedMarkdown
        SomeView.markdownBuilder = markdownBuilder
    }
    
    public func markdown(forScreenID screenID: String) -> String? {
        screens
            .first { screen in
                guard let id = screen.id else { return false }
                
                return id == screenID
            }?
        .markdown
    }
}
