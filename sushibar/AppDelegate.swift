//
//  AppDelegate.swift
//  sushibar
//
//  Created by mzp on 2016/10/29.
//  Copyright © 2016 mzp. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarItemIdentifier {
    static let kome = NSTouchBarItemIdentifier("jp.mzp.touchbar.kome")
    static let fish = NSTouchBarItemIdentifier("jp.mzp.touchbar.fish")
    static let sushi = NSTouchBarItemIdentifier("jp.mzp.touchbar.sushi")
}

@available(OSX 10.12.1, *)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTouchBarProvider, NSTouchBarDelegate {

    @IBOutlet weak var window: NSWindow!
    var touchBar: NSTouchBar?

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

        self.touchBar = makeTouchBar()
    }


    func makeTouchBar() -> NSTouchBar? {
        let mainBar = NSTouchBar()
        mainBar.delegate = self
        mainBar.defaultItemIdentifiers = [.kome, .fish, .sushi]
        return mainBar
    }

    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        if identifier == .kome {
            let item = NSCustomTouchBarItem(identifier: identifier)
            let button = NSButton(title: "🍚", target: self, action: #selector(AppDelegate.tapped(_:)))
            item.view = button
            return item
        } else if identifier == .fish {
            let item = NSCustomTouchBarItem(identifier: identifier)
            let button = NSButton(title: "🐟", target: self, action: #selector(AppDelegate.tapped(_:)))
            item.view = button
            return item
        } else if identifier == .sushi {
            let item = NSCustomTouchBarItem(identifier: identifier)
            let button = NSButton(title: "🍣", target: self, action: #selector(AppDelegate.tapped(_:)))
            item.view = button
            return item
        } else {
            return nil
        }
    }

    @objc
    func tapped(_ sender : NSObject) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

