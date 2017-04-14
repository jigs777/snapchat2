//
//  RightViewController.swift
//  SnapchatSwipeView
//
//  Created by EL-Consumer Sketch on 08/03/17.
//  Copyright © 2017 Brendan Lee. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {

    @IBOutlet weak var btn_Back: UIButton!
    var isConnection = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        if isConnection
        {
            btn_Back.isHidden = false
        }
        else
        {
            btn_Back.isHidden = true
        }
        
    }
    
    
    @IBAction func btn_clickBack(_ sender: UIButton)
    {
        _ = navigationController?.popToRootViewController(animated: true)
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
