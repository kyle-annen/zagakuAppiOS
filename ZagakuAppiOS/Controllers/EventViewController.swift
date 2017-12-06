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
    var calendarViewHelper = CalendarViewHelper()

    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet var eventTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = event.summary

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
        
        
        if let location = event.location {
            content += "Location\n\(location)"
            content += lineBreak
        }

        if let dateTime = event.start_time {
            let formatedDateText = calendarViewHelper.formatDate(dateTime: dateTime)
            content += "Start Time\n\(formatedDateText)"
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
