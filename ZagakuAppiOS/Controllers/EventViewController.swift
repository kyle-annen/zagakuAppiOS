//
//  EventViewController.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 10/31/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
    var event: ZagakuDate!
    let dateTimeUtilities: DateTimeUtilities = DateTimeUtilities()
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet var eventTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let summary: String = event.summary {
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
        
        if let location: String = event.location {
            content += "Location\n\(location)"
            content += lineBreak
        }

        if let dateTime: String = event.start_time {
            let date: Date = dateTimeUtilities.convertISO8601Date(googleDateTime: dateTime)
            let formatedDateText: String = dateTimeUtilities.formatDateForCalendarSubtitle(date: date)
            content += "Start Time\n\(formatedDateText)"
            content += lineBreak
        }
        
        if let gCalLink: String = event.link {
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
