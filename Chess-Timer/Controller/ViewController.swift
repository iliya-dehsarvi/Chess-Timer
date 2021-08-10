//
//  ViewController.swift
//  Chess-Timer
//
//  Created by Iliya dehsarvi on 8/8/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
	
	let players = ["Ali", "Iliya"]
	let times = [23, 20]
	
	@IBOutlet weak var timerLabel: UILabel!
	@IBOutlet weak var timerPerMoveChart: LineChartView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		var dataEntries: [ChartDataEntry] = []
		for i in 0..<players.count-1 {
			let dataEntry = ChartDataEntry(x: Double(times[i]), y: Double(i))
			dataEntries.append(dataEntry)
		}
		let lineChartDataSet = LineChartDataSet(entries: dataEntries, label: nil)
		let lineChartData = LineChartData(dataSet: lineChartDataSet)
		timerPerMoveChart.data = lineChartData
	}
}

