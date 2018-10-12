//
//  TimeLineDataController.swift
//  NetworkingWorkshop
//
//  Created by Moaz Ahmed on 10/12/18.
//  Copyright © 2018 Moaz. All rights reserved.
//

import Foundation


class TimeLineDataController {
    
    var timelines: [Timeline]?
    
    func fetchData(completion: @escaping () -> Void) {
        let url = URL(string: "https://nodeswiftcairo.herokuapp.com/api/timelines")!
        _ = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            self?.timelines = [Timeline]()
            let rangeOfSuccessfulHttpCode = 200...399
            if rangeOfSuccessfulHttpCode ~= (response as! HTTPURLResponse).statusCode {
                guard let responseData = data else { fatalError() }
                guard let jsonArray = try? JSONSerialization.jsonObject(with: responseData, options: .allowFragments) as! [[String:Any]] else { fatalError() }
                for jsonObject in jsonArray {
                    let name = jsonObject["user"] as! String
                    let image = jsonObject["image"] as! String
                    let date = jsonObject["date"] as! String
                    let timeline = Timeline(user: name, image: image, date: date, text: "")
                    self?.timelines?.append(timeline)
                }
                completion()
            }
        }.resume()
    }
    
    
}

struct Timeline: Decodable {
    let user: String
    let image: String
    let date: String
    let text: String
}
