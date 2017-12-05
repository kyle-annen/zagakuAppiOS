//
//  EventViewController.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/31/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    var event: Dictionary<String, Any?> = [:]
    let dateTimeUtilities: DateTimeUtilities = DateTimeUtilities()
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet var eventTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let summary = event["summary"] as? String {
            title = summary
        }
        
        eventTextView.isUserInteractionEnabled = false
        eventTextView.text = buildEventTextContent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildEventTextContent() -> String {
        var content: String = ""
        let lineBreak: String = "\n\n"
        
        if let location = event["location"] as? String {
            content += "Location\n\(location)"
            content += lineBreak
        }

        if let startTime = event["start"] as? [String: Any],
        let dateTime = startTime["dateTime"] as? String {
            let date: Date = dateTimeUtilities.convertISO8601Date(googleDateTime: dateTime)
            let formatedDateText: String = dateTimeUtilities.formatDateForCalendarSubtitle(date: date)
            content += "Start Time\n\(formatedDateText)"
            content += lineBreak
        }
        
        if let gCalLink = event["htmlLink"] as? String {
            content += "Link\n\(gCalLink)"
            content += lineBreak
        }
        
        return content
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
