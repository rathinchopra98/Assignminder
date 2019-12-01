//
//  DateConverter.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-11-25.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation
import UIKit

class DateConverter{
    
    func convertDateToString(dateToConvert: Date) -> String {
         let formatter = DateFormatter()
         // initially set the format based on your datepicker date / server String
         formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

         let myString = formatter.string(from: dateToConvert) // string purpose I add here
         // convert your string to date
         let yourDate = formatter.date(from: myString)
         //then again set the date format whhich type of output you need
         formatter.dateFormat = "dd-MMM-yyyy"
         // again convert your date to string
         let myStringafd = formatter.string(from: yourDate!)
        
        return myStringafd
    }
    
    func convertStringToDate(dateChange: String) -> Date{
        
        if(dateChange != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: dateChange)
            
            return date!
        }
        else{
            return Date()
        }
    }
}
