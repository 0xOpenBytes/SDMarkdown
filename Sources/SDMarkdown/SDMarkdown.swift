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
        screen: SomeScreen
    ) {
        self.screens = [screen]
    }
    
    public init(
        screen: SomeScreen,
        customizedMarkdown: [SDCustomizedMarkdown]? = nil,
        markdownBuilder: SomeViewMarkdownBuildable? = nil
    ) {
        self.screens = [screen]
        
        if let customizedMarkdown = customizedMarkdown {
            customizedMarkdown.forEach {
                SomeCustomView.customizedMarkdown[$0.id] = $0
            }
        }
        
        if let markdownBuilder = markdownBuilder {
            SomeView.markdownBuilder = markdownBuilder
        }
    }
    
    public init(
        screens: [SomeScreen]
    ) {
        self.screens = screens
    }
    
    public init(
        screens: [SomeScreen],
        customizedMarkdown: [SDCustomizedMarkdown]? = nil,
        markdownBuilder: SomeViewMarkdownBuildable? = nil
    ) {
        self.screens = screens
        
        if let customizedMarkdown = customizedMarkdown {
            customizedMarkdown.forEach {
                SomeCustomView.customizedMarkdown[$0.id] = $0
            }
        }
        
        if let markdownBuilder = markdownBuilder {
            SomeView.markdownBuilder = markdownBuilder
        }
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
