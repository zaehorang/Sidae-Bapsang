//
//  CrawManager.swift
//  Sidae-Bapsang
//
//  Created by zaehorang on 2023/10/05.
//

import Alamofire
import SwiftSoup
import Foundation


struct CrawlManager {
    
    // 학생회관
    static func crawlStudentUnionMenu() {
        let urlStr = "https://www.uos.ac.kr/food/placeList.do"
        
        AF.request(urlStr).responseString { (response) in
            guard let html = response.value else { return }
            
            do {
                let doc: Document = try SwiftSoup.parseBodyFragment(html)  // body 부분만 가져오기
                let elements: Elements = try doc.select("#week > table > tbody > tr")
                
                // 학식 가능한 날의 수
                print("요일 수: \(elements.count)")
                
            
                
                // 학식 가능한 날짜
                for element in elements {
                    let day = try element.select("th")[0].text()
                    
                    let menus = try element.select("td")
                    
                    let breakfast = try menus[0].text()
                    let lunch = try menus[1].text()
                    let dinner = try menus[2].text()
                    print("-----------------------")
                    print(day)
                    print("-----------------------")
                    print(breakfast)
                    print("-----------------------")
                    print(lunch)
                    print("-----------------------")
                    print(dinner)
                }
                
                
            } catch (_) {
                print("crawl error")
            }
            
        }
    }
}
