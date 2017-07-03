//
//  InfinitySushi.swift
//  sushibar
//
//  Created by mzp on 2016/10/29.
//  Copyright © 2016 mzp. All rights reserved.
//

import Foundation
import AppKit

class SushiLaneController : NSViewController {
    let lane = NSView()
    var mvString="🍣"
    
    override func loadView() {
        self.view = NSView()
    }

    override func viewDidAppear() {
        lane.frame = CGRect(x: 0, y: 0, width: self.view.frame.width*2, height: self.view.frame.height)
        lane.layer?.position = CGPoint(x: 0, y: 0)

        self.view.addSubview(lane)

        for x in 0...16 {
            lane.addSubview(makeSushi(x: x * 100))
        }
        start()
    }

    func setStr(str: String){
        mvString = str
    }
    
    func makeSushi(x : Int) -> NSView {
        let sushi = NSTextView(frame: NSRect(x: x, y: 0, width: 30, height: 30))
        sushi.string = mvString
        sushi.drawsBackground = false
        sushi.isEditable = false
        sushi.isSelectable = false
        sushi.font = NSFont.systemFont(ofSize: 20)
        return sushi
    }

    func start() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.repeatCount = .infinity
        animation.duration = 8
        animation.fromValue = lane.layer?.position
        animation.toValue = NSValue(point: NSPoint(x: -self.view.frame.width, y: 0))
        lane.layer?.add(animation, forKey: "position")
    }
}
