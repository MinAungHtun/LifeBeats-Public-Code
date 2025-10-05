//
//  QuizQuestions.swift
//  LifeBeats
//
//  Created by User on 4/7/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Alamofire
import AVFoundation

class QuizQuestions
{
    static let sharedInstance = QuizQuestions()
    typealias JSONStandard = [String : AnyObject]
    var question : String = " "
    var correctAnswer : String = " "
    var incorrectAnswer1 : String = " "
    var incorrectAnswer2 : String = " "
    
    func getQuestion()
    {
        let searchURL = "https://trivia.willfry.co.uk/api/questions?limit=1"
        Alamofire.request(searchURL).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            //print(response.data!)
        })
    }
    
    func parseData(JSONData : Data)
    {
    do{
        var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) //as! NSArray
        print(readableJSON)
        
        guard let newValue = readableJSON as? NSArray else {
                                    print("invalid format")
                                    return
                                }
        
        if let weather = newValue[0] as? [String: Any]
        {
           // print(weather["category"]!)
            self.question = weather["question"] as? String ?? "Error"
            self.correctAnswer = weather["correctAnswer"] as? String ?? "Error"
            //print(weather["question"]!)
            //print(weather["correctAnswer"]!)
            if let choices = weather["incorrectAnswers"] as? NSArray
            {
                self.incorrectAnswer1 = choices[0] as? String ?? "Error"
                self.incorrectAnswer2 = choices[1] as? String ?? "Error"
                print(choices[0])
                print(choices[1])
            }
        }
        
//        if let tracks = readableJSON[0] as? NSArray
//        {
//            print(tracks)
//            if let items = tracks["incorrectAnswers"] as? [JSONStandard]
//            {
//                print(items)
//            }
//        }
        
    }
    catch{
        print(error)
    }
    
    }
}
