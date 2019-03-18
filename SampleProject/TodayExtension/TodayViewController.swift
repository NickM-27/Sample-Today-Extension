//
//  TodayViewController.swift
//  TodayExtension
//
//  Created by Mime on 2019/03/18.
//  Copyright © 2019 Mikael. All rights reserved.
//

import UIKit
import NotificationCenter

final class TodayViewController: UIViewController, NCWidgetProviding {
    @IBOutlet weak var line1Time: UILabel!
    @IBOutlet weak var line2Time: UILabel!
    @IBOutlet weak var line3Time: UILabel!
    @IBOutlet weak var line1Users: UILabel!
    @IBOutlet weak var line2Users: UILabel!
    @IBOutlet weak var line3Users: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded

    }
        
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }

    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let expanded = activeDisplayMode == .expanded
        preferredContentSize = expanded ? CGSize(width: maxSize.width, height: 200) : maxSize
    }

    // from : https://www.raywenderlich.com/697-today-extension-tutorial-getting-started
    //After updating the preferred size, you must reload the chart’s data so that it redraws based on the new layout.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateData()
    }

    private func updateData() {
        //Request server for updated data
    }

    //When finished Make sure the BTC Widget scheme is selected. Build and run.

}
