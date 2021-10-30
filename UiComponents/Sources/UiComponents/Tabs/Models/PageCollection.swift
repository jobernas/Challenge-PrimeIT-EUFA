//
//  PageCollection.swift
//  
//
//  Created by João Luís on 29/10/2021.
//

import Foundation

public class PageCollection {
    
    public var pages = [Page]()
    public var selectedPage: Int = 0
    
    public init (pages: [Page], selectedPage: Int = 0) {
        self.pages = pages
        self.selectedPage = selectedPage
    }
    
    public func loadPages(pages: [Page]) {
        selectedPage = 0
        self.pages.removeAll()
        self.pages.append(contentsOf: pages)
    }
    
    public func getSelectedPage() -> Page? {
        return pages.getOrNil(selectedPage)
    }
}
