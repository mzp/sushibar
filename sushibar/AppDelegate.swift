//
//  AppDelegate.swift
//  sushibar
//
//  Created by mzp on 2016/10/29.
//  Copyright © 2016 mzp. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.title = "🍣"

        if let frame = window.contentView?.frame {
            let sushi = NSTextView(frame: NSMakeRect(frame.size.width/2-64, frame.size.height/2-64, 150, 128))
            sushi.string = "🍣"
            sushi.drawsBackground = false
            sushi.isEditable = false
            sushi.isSelectable = false
            sushi.font = NSFont.systemFont(ofSize: 128)
            window.contentView?.addSubview(sushi)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

