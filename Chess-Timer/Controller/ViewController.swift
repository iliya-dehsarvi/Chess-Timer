//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
	
	@IBOutlet weak var timerLabel: UILabel!
	
	var count = 0
	var seconds = 9
	
	var timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(update), userInfo: nil, repeats: true)

	override func viewDidLoad() {
		super.viewDidLoad()
		timer.invalidate()
	}
	
	@objc func update() {
//	    if(count > -1) {
//		    if String(count).count == 1 {
//			    timerLabel.text = "00:0\(seconds).0\(count)"
//		    } else {
//			    timerLabel.text = "00:0\(seconds).\(count)"
//		    }
//		    count-=1
//	    } else if (seconds > 0) {
//		    if String(count).count == 1 {
//			    timerLabel.text = "00:0\(seconds).0\(count)"
//		    } else {
//			    timerLabel.text = "00:0\(seconds).\(count)"
//		    }
//		    count=100
//		    seconds-=1
//	    }
		setTimerLabel(millieSec: count)
		count += 1
	}
	
	private func setTimerLabel(millieSec: Int) {
		var min = "\(Int(Double(millieSec)*1.66667e-5))"
		if min.count == 1 {
			min = "0\(min)"
		}
		
		var sec = "\(Int((Double(millieSec)*0.0001).truncatingRemainder(dividingBy: 60)*100))"
		if sec.count == 1 {
			sec = "0\(sec)"
		}
		var millie = String((Int(millieSec%10000)*100)/100)
		if millie.count == 1 {
			millie = "0\(millie)"
		}
		print("\(min):\(sec).\(millie)")
		timerLabel.text = "\(min):\(sec).\(millie)"
	}
	
	@IBAction func startButton(_ sender: UIButton) {
		self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
	}
	
	@IBAction func resetButton(_ sender: UIButton) {
		count = 99
		seconds = 9
		timerLabel.text = "00:0\(seconds).\(count)"
		self.timer.invalidate()
		
	}
	@IBAction func pauseButton(_ sender: UIButton) {
		self.timer.invalidate()
	}
	
	
	
}

