//
//  MainModel.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation


class MainModel: Codable {
    var date: String = ""
    var reason: String = ""
    var room: String = ""
    var team: String = ""
    var accept: Int = -1
    
    
    enum MainModelKeys : String, CodingKey{
        case date = "date"
        case reason
        case room
        case team
        case accept
    }
    
    required convenience init(from decoder: Decoder) throws {
        self.init()
        
        let container = try decoder.container(keyedBy: MainModelKeys.self)

        var stringDate:String = ""
        var intDate:Int = -1
        
        do {
            stringDate = try container.decodeIfPresent(String.self, forKey: .date) ?? ""
        }catch {
            intDate = try container.decodeIfPresent(Int.self, forKey: .date) ?? -1
        }
        
        self.date = intDate == -1 ? stringDate : String(intDate)
        self.reason = try container.decodeIfPresent(String.self, forKey: .reason) ?? ""
        self.room = try container.decodeIfPresent(String.self, forKey: .room) ?? ""
        self.team = try container.decodeIfPresent(String.self, forKey: .team) ?? ""
        self.accept = try container.decodeIfPresent(Int.self, forKey: .accept) ?? -1
        
    }
}
