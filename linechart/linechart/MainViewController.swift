
import UIKit
import QuartzCore

class MainViewController: UIViewController, LineChartDelegate {

    
    
    var label = UILabel()
    var lineChart: LineChart!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var views: [String: AnyObject] = [:]
        
        label.text = "..."
        label.setTranslatesAutoresizingMaskIntoConstraints(false)
        label.textAlignment = NSTextAlignment.Center
        self.view.addSubview(label)
        views["label"] = label
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[label]-|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-80-[label]", options: nil, metrics: nil, views: views))
        
        var data: [CGFloat] = [3, 4, -2, 11, 13, 15]
//        var data2: [CGFloat] = [1, 3, 5, 13, 17, 20]
        
        lineChart = LineChart()
        lineChart.areaUnderLinesVisible = true
        lineChart.labelsXVisible = true
        lineChart.labelsYVisible = true
        lineChart.addLine(data)
//        lineChart!.addLine(data2)
        lineChart.setTranslatesAutoresizingMaskIntoConstraints(false)
        lineChart.delegate = self
        lineChart.layer.borderColor = UIColor.blueColor().CGColor
        lineChart.layer.borderWidth = 1
        self.view.addSubview(lineChart)
        views["chart"] = lineChart
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[chart]-|", options: nil, metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[label]-[chart(==200)]", options: nil, metrics: nil, views: views))
        
//        var delta: Int64 = 4 * Int64(NSEC_PER_SEC)
//        var time = dispatch_time(DISPATCH_TIME_NOW, delta)
//        
//        dispatch_after(time, dispatch_get_main_queue(), {
//            self.lineChart!.clear()
//            self.lineChart!.addLine(data2)
//        });
        
//        var scale = LinearScale(domain: [0, 100], range: [0.0, 100.0])
//        var linear = scale.scale()
//        var invert = scale.invert()
//        println(linear(x: 2.5)) // 50
//        println(invert(x: 50)) // 2.5
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    /**
     * Line chart delegate method.
     */
    func didSelectDataPoint(x: CGFloat, yValues: Array<CGFloat>) {
        label.text = "x: \(x)     y: \(yValues)"
    }
    
    
    
    /**
     * Redraw chart on device rotation.
     */
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        if let chart = lineChart {
            chart.setNeedsDisplay()
        }
    }

}
