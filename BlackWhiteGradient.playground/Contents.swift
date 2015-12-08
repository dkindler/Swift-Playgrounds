// Dec 7 2015
// GOAL: Create function to add a black to white gradient on a given UIView

import UIKit

func addGradient(view: UIView) -> UIView {
    let lines:Int = Int(view.frame.width)
    var count = 0
    while count < lines {
        let line = UIView(frame: CGRectMake((1 * CGFloat(count)), 0, 1, view.frame.height))
        line.backgroundColor = UIColor(white: CGFloat(count)/CGFloat(lines), alpha: 1)
        view.addSubview(line)
        count += 1
    }
    
    return view
}

let view = UIView(frame: CGRectMake(0, 0, 100, 50))
addGradient(view)

view
