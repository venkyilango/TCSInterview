//
//  TCSModels.swift
//  TCSVenky29March
//
//  Created by Venkateshwaran Ilangovan on 3/28/21.
//

import Foundation

struct schoolJsonResponse:Decodable {
    var school_name: String
    var location: String
    var phone_number: String
    var website: String
    var zip: String
    var dbn: String
}



struct satJSONResponse:Decodable {
    var dbn: String
    var school_name: String
    var num_of_sat_test_takers: String
    var sat_critical_reading_avg_score: String
    var sat_math_avg_score: String
    var sat_writing_avg_score: String
}





/*
 "dbn":"01M292","school_name":"HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES","num_of_sat_test_takers":"29","sat_critical_reading_avg_score":"355","sat_math_avg_score":"404","sat_writing_avg_score":"363"
 */
