//
//  TCSNetworkComposer.swift
//  TCSVenky29March
//
//  Created by Venkateshwaran Ilangovan on 3/28/21.
//

import Foundation

class TCSRequestComposer: NSObject {
    
    //  Static Instance variable for Singleton
    static var sharedSessionManager = TCSRequestComposer()
    var schoolresponseValue: [schoolJsonResponse]!
    var satresponseValue: [satJSONResponse]!
    //  Function to execute GET request and pass data from escaping closure
    
    func executeGetRequest(with urlString: String, completion: @escaping (Data?) -> ()) {
        
        let url = URL.init(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //  Log errors (if any)
            if error != nil {
                print(error.debugDescription)
            } else {
                //  Passing the data from closure to the calling method
                completion(data)
            }
        }.resume()  // Starting the dataTask
    }
    
    
    
    func parseSchoolData(rooturl: String, completion: @escaping ([schoolJsonResponse]?) -> ()){
        executeGetRequest(with: rooturl) { (data) in  // Data received from closure
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                self.schoolresponseValue = try decoder.decode([schoolJsonResponse].self , from: data)
                completion(self.schoolresponseValue)
                
            }
            catch {
                //handle error
                print(error)
            }
        }
    }
    
    func parseSatScoreData(rooturl: String, completion: @escaping ([satJSONResponse]?) -> ()){
        
        executeGetRequest(with: rooturl) { (data) in
            guard let data = data else { return }
            do {

                let decoder = JSONDecoder()
                self.satresponseValue = try decoder.decode([satJSONResponse].self , from: data)
                completion(self.satresponseValue)
            }
            catch {
                //handle error
                print(error)
            }
        }
    }
}

