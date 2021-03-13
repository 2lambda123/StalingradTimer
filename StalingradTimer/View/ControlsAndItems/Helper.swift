//
//  Helper.swift
//  StalingradTimer
//
//  Created by mac on 13.03.2021.
//

import SwiftUI

//MARK: - секунды в часы минуты секунды
extension View {
    func secondsToMinutesAndSeconds(seconds: Int) -> String {
        let hour = "\((seconds / 3600) * 60 + ((seconds % 3600) / 60))"
        let minute = "\((seconds % 3600) / 60)"
        let second = "\((seconds % 3600) % 60)"
        let hourPlusMinute =  hour
        let minuteStamp = minute.count > 1 ? minute : "0" + minute
        let secondStamp = second.count > 1 ? second : "0" + second
        
        return
            seconds > 3599 ? "\(hourPlusMinute):\(secondStamp)" :
            "\(minuteStamp):\(secondStamp)"
        
    }
}
