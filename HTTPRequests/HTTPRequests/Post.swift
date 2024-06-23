//
//  Post.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 22.06.2024.
//

import Foundation

struct Post: Codable {
    let status: String
    let copyright: String
    let num_results: Int
    var results: Array<EmailedArticle>
}
struct EmailedArticle: Codable {
    let uri: String
    let url: String
    let adxKeywords: String
    let subsection: String
    let column: String?
    let etaId: Int
    let section: String
    let id: Int
    let assetId: Int
    let nytdsection: String
    let byline: String
    let type: String
    let title: String
    let abstract: String
    let publishedDate: String
    let source: String
    let updated: String
    let desFacet: Array<String>?
    let orgFacet: Array<String>?
    let perFacet: Array<String>?
    let geoFacet: Array<String>?
    var media: Array<MediaS>
    
    enum CodingKeys: String, CodingKey {
        case uri = "uri"
        case url = "url"
        case adxKeywords = "adx_keywords"
        case subsection = "subsection"
        case column = "column"
        case etaId = "eta_id"
        case section = "section"
        case id = "id"
        case assetId = "asset_id"
        case nytdsection = "nytdsection"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case publishedDate = "published_date"
        case source = "source"
        case updated = "updated"
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media = "media"
    }
}

struct MediaS: Codable {
    let type: String
    let subtype: String
    let caption: String
    let copyright: String
    let approvedForSyndication: Int
    var mediaMetadata: Array<Metadata>
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case subtype = "subtype"
        case caption = "caption"
        case copyright = "copyright"
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}

struct Metadata: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}

//struct Post: Codable {
//    let userId: Int
//    let id: Int
//    let title: String
//    let body: String
//}


//{
//  "status": "OK",
//  "copyright": "Copyright (c) 2024 The New York Times Company.  All Rights Reserved.",
//  "num_results": 20,
//  "results": [
//    {
//      "uri": "nyt://article/d5c1f62e-0335-5b72-a1cd-d8d3e115371b",
//      "url": "https://www.nytimes.com/2024/06/14/science/swimming-lions-3-legged.html",
//      "id": 100000009482265,
//      "asset_id": 100000009482265,
//      "source": "New York Times",
//      "published_date": "2024-06-14",
//      "updated": "2024-06-20 14:58:56",
//      "section": "Science",
//      "subsection": "",
//      "nytdsection": "science",
//      "adx_keywords": "Lions;Animal Behavior;Research;your-feed-science;Ecology and Evolution (Journal);Uganda",
//      "column": null,
//      "byline": "By Anthony Ham",
//      "type": "Article",
//      "title": "Why a 3-Legged Lion and His Brother Swam Across a Crocodile-Filled River",
//      "abstract": "Researchers say the nearly mile-long swim was the longest by big cats ever recorded.",
//      "des_facet": [
//        "Lions",
//        "Animal Behavior",
//        "Research",
//        "your-feed-science"
//      ],
//      "org_facet": [
//        "Ecology and Evolution (Journal)"
//      ],
//      "per_facet": [],
//      "geo_facet": [
//        "Uganda"
//      ],
//      "media": [
//        {
//          "type": "image",
//          "subtype": "photo",
//          "caption": "Jacob, a lion who lost a limb in a poacher’s trap in 2020, and Tibu, his brother, completed a swim across the Kazinga Channel in Uganda in February. ",
//          "copyright": "Alex Braczkowski",
//          "approved_for_syndication": 0,
//          "media-metadata": [
//            {
//              "url": "https://static01.nyt.com/images/2024/06/14/multimedia/14tb-swimming-lions-01-vtjz/14tb-swimming-lions-01-vtjz-thumbStandard.jpg",
//              "format": "Standard Thumbnail",
//              "height": 75,
//              "width": 75
//            }
//          ]
//        }
//      ],
//      "eta_id": 0
//    }
//  ]
//}
