//
//  Models.swift
//  LearningAppV1
//
//  Created by Jamie Latiolais on 4/10/23.
//

import Foundation

struct Module: Identifiable, Decodable, Hashable {
    
    var id:Int
    var category:String
    var content:Content
    var test:Test
    
}

struct Content: Identifiable, Decodable, Hashable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var lessons:[Lessons]
    
}

struct Lessons: Identifiable, Decodable, Hashable {
    
    var id:Int
    var title:String
    var video:String
    var duration:String
    var explanation:String
    
}

struct Test: Identifiable, Decodable, Hashable {
    
    var id:Int
    var image:String
    var time:String
    var description:String
    var questions:[Question]
    
}

struct Question: Identifiable, Decodable, Hashable {
    
    var id:Int
    var content:String
    var correctIndex:Int
    var answers:[String]
    
}
