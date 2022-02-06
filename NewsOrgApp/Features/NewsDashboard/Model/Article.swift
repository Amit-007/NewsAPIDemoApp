//
//  Article.swift
//  NewsOrgApp
//
//  Created by Amit Majumdar on 2/5/22.
//

import Foundation

struct Article: Codable, Identifiable, Equatable {
    
    var id = UUID()
    var source: Source?
    var author: String?
    var title: String?
    var footnote: String
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    var articleID: String
    var displayDate: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "source"
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(Source.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        footnote = .empty
        // Footnote is a combination of author & sourceName.
        // The ideal format is AUTHORNAME | Source
        // However if AUTHORNAME is Null or Empty, it will be displayed as sourcename only
        // If both Author & Source are not there footnote will be empty
        if let authorName = author {
            footnote = authorName.uppercased()
            if let sourceName = source?.name {
                if !footnote.isEmptyString {
                    footnote = footnote + .pipe + sourceName
                } else {
                    footnote = sourceName
                }
            }
        }
        else if let sourceName = source?.name {
            footnote = sourceName
        }
        articleID = .empty
        if let safeURL = url {
            articleID = safeURL.formattedArticleID
        }
        displayDate = .empty
        if let publishedAt = publishedAt {
            displayDate = publishedAt.changeDateFormat(from: .server)
        }
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id &&
        lhs.source == rhs.source &&
        lhs.author == rhs.author &&
        lhs.title == rhs.title &&
        lhs.description == rhs.description &&
        lhs.url == rhs.url &&
        lhs.urlToImage == rhs.urlToImage &&
        lhs.publishedAt == rhs.publishedAt &&
        lhs.content == rhs.content &&
        lhs.footnote == rhs.footnote &&
        lhs.articleID == rhs.articleID &&
        lhs.displayDate == rhs.displayDate
    }
}
