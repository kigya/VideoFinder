//
//  ResponceBody.swift
//  VideoFinder
//
//  Created by Kirill Borichevskiy on 28/04/2022.
//

import Foundation

struct ResponseBody: Decodable {
    var page: Int
    var perPage: Int
    var totalResults: Int
    var url: String
    var videos: [Video]

}
