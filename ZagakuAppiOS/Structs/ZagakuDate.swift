//
//  ZagakuDate.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 12/4/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import Foundation

struct ZagakuDate: Codable {
    let id: Int
    let calendar_id: String
    let start_time: String
    let end_time: String
    let summary: String
    let link: String?
    let location: String?
    let hangout_link: String?
    let created_at: String?
    let updated_at: String?
}
