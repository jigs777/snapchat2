//
//  LeftViewController.swift
//  SnapchatSwipeView
//
//  Created by EL-Consumer Sketch on 08/03/17.
//  Copyright © 2017 Brendan Lee. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tblMessage: UITableView!
    @IBOutlet weak var btn_Back: UIButton!
    
    var isTapMessage = Bool()
    
    var arrMessage = NSMutableArray()
    
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
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        if isTapMessage
        {
            btn_Back.isHidden = false
        }
        else
        {
            btn_Back.isHidden = true
        }
        arrMessage = ["Jigar","Priyanka","Salman","Rahul","Jay","Mayank","Boby","Ritesh", "Hello","World"]
        
        self.tblMessage.reloadData()
        
    }
    
    @IBAction func btn_ClickBack(_ sender: UIButton)
    {
        _ = navigationController?.popToRootViewController(animated: true)

    }
    
    // MARK: - tableview Delegate Method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrMessage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : MessageViewCell = tableView.dequeueReusableCell(withIdentifier: "messagecell", for: indexPath) as! MessageViewCell
        
        cell.lblUserName.text = arrMessage.object(at: indexPath.row) as? String
        cell.lblMessage.text = "test"
        return cell
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
