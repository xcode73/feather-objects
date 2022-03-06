//
//  FeatherMetadata+CRUD.swift
//  FeatherApi
//
//  Created by Tibor Bodecs on 2022. 03. 05..
//

import Foundation

public extension FeatherMetadata {
    
    // MARK: -
    
    struct List: Codable {
        
        public let id: UUID
        public let module: String
        public let model: String
        public let reference: UUID
        public let slug: String
        public let title: String?
        public let excerpt: String?
        public let imageKey: String?
        public let date: Date
        public let status: FeatherMetadata.Status
        public let feedItem: Bool
        public let canonicalUrl: String?
        public let filters: [String]
        public let css: String?
        public let js: String?
        
        public init(id: UUID,
                    module: String,
                    model: String,
                    reference: UUID,
                    slug: String,
                    title: String? = nil,
                    excerpt: String? = nil,
                    imageKey: String? = nil,
                    date: Date,
                    status: FeatherMetadata.Status,
                    feedItem: Bool,
                    canonicalUrl: String? = nil,
                    filters: [String],
                    css: String? = nil,
                    js: String? = nil) {
            self.id = id
            self.module = module
            self.model = model
            self.reference = reference
            self.slug = slug
            self.title = title
            self.excerpt = excerpt
            self.imageKey = imageKey
            self.date = date
            self.status = status
            self.feedItem = feedItem
            self.canonicalUrl = canonicalUrl
            self.filters = filters
            self.css = css
            self.js = js
        }
    }
    
    // MARK: -
    
    struct Detail: Codable {
        public let id: UUID
        public let module: String
        public let model: String
        public let reference: UUID
        public let slug: String
        public let title: String?
        public let excerpt: String?
        public let imageKey: String?
        public let date: Date
        public let status: FeatherMetadata.Status
        public let feedItem: Bool
        public let canonicalUrl: String?
        public let filters: [String]
        public let css: String?
        public let js: String?
        
        public init(id: UUID,
                    module: String,
                    model: String,
                    reference: UUID,
                    slug: String,
                    title: String? = nil,
                    excerpt: String? = nil,
                    imageKey: String? = nil,
                    date: Date,
                    status: FeatherMetadata.Status,
                    feedItem: Bool,
                    canonicalUrl: String? = nil,
                    filters: [String],
                    css: String? = nil,
                    js: String? = nil) {
            self.id = id
            self.module = module
            self.model = model
            self.reference = reference
            self.slug = slug
            self.title = title
            self.excerpt = excerpt
            self.imageKey = imageKey
            self.date = date
            self.status = status
            self.feedItem = feedItem
            self.canonicalUrl = canonicalUrl
            self.filters = filters
            self.css = css
            self.js = js
        }
    }
    
    // MARK: -
    
    struct Update: Codable {
        public let slug: String
        public let title: String?
        public let excerpt: String?
        public let imageKey: String?
        public let date: Date
        public let status: FeatherMetadata.Status
        public let feedItem: Bool
        public let canonicalUrl: String?
        public let filters: [String]
        public let css: String?
        public let js: String?
        
        public init(slug: String,
                    title: String? = nil,
                    excerpt: String? = nil,
                    imageKey: String? = nil,
                    date: Date,
                    status: FeatherMetadata.Status,
                    feedItem: Bool,
                    canonicalUrl: String? = nil,
                    filters: [String],
                    css: String? = nil,
                    js: String? = nil) {
            self.slug = slug
            self.title = title
            self.excerpt = excerpt
            self.imageKey = imageKey
            self.date = date
            self.status = status
            self.feedItem = feedItem
            self.canonicalUrl = canonicalUrl
            self.filters = filters
            self.css = css
            self.js = js
        }
    }
    
    // MARK: -
    
    struct Patch: Codable {
        public let slug: String?
        public let title: String?
        public let excerpt: String?
        public let imageKey: String?
        public let date: Date?
        public let status: FeatherMetadata.Status?
        public let feedItem: Bool?
        public let canonicalUrl: String?
        public let filters: [String]?
        public let css: String?
        public let js: String?
        
        public init(slug: String? = nil,
                    title: String? = nil,
                    excerpt: String? = nil,
                    imageKey: String? = nil,
                    date: Date? = nil,
                    status: FeatherMetadata.Status? = nil,
                    feedItem: Bool? = nil,
                    canonicalUrl: String? = nil,
                    filters: [String]? = nil,
                    css: String? = nil,
                    js: String? = nil) {
            self.slug = slug
            self.title = title
            self.excerpt = excerpt
            self.imageKey = imageKey
            self.date = date
            self.status = status
            self.feedItem = feedItem
            self.canonicalUrl = canonicalUrl
            self.filters = filters
            self.css = css
            self.js = js
        }
    }
}
