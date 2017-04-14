//
//  HomeViewController.swift
//  007Percent
//
//  Created by EL-Consumer Sketch on 09/03/17.
//  Copyright © 2017 Brendan Lee. All rights reserved.
//

import UIKit

class SlideHorSegue: UIStoryboardSegue {
    override func perform() {
        
        //credits to http://www.appcoda.com/custom-segue-animations/
        
        let firstClassView = self.source.view
        let secondClassView = self.destination.view
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        secondClassView?.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        if let window = UIApplication.shared.keyWindow {
            
            window.insertSubview(secondClassView!, aboveSubview: firstClassView!)
            
            UIView.animate(withDuration: 0.4, animations: { () -> Void in
                
                firstClassView?.frame = (firstClassView?.frame)!.offsetBy(dx: screenWidth, dy: 0)
                secondClassView?.frame = (secondClassView?.frame)!.offsetBy(dx: screenWidth, dy: 0)
                
            }) {(Finished) -> Void in
                
                self.source.navigationController?.pushViewController(self.destination, animated: false)
                
            }
            
        }
        
    }
    
}

class HomeViewController: UIViewController,UIScrollViewDelegate
{

    
    @IBOutlet weak var lblTitle: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
  

    @IBAction func btn_Clickmsg(_ sender: Any)
    {
        self.performSegue(withIdentifier: "segueleft", sender: nil)
    }
    
    @IBAction func btn_ClickConnection(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "segueright", sender: nil)

    }
    
   

    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?)
     {
        if segue.identifier == "segueleft"  {
            
            let leftvc = segue.destination as! LeftViewController
            
            leftvc.isTapMessage = true
            
            
            
        }
        if segue.identifier == "segueright"  {
            
            let rightvc = segue.destination as! RightViewController
            
            rightvc.isConnection = true
        }
     }
    
}
