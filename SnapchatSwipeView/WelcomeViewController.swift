//
//  WelcomeViewController.swift
//  007Percent
//
//  Created by EL-Consumer Sketch on 08/03/17.
//  Copyright © 2017 Brendan Lee. All rights reserved.
//

import UIKit

class WelcomeViewController:  UIViewController,UIScrollViewDelegate
{
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate


    override func viewDidLoad()
    {
        
        
        super.viewDidLoad()
        
        self.scrollView.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        let scrollViewWidth:CGFloat = self.scrollView.frame.width
        let scrollViewHeight:CGFloat = self.scrollView.frame.height
        
        
        let imgOne = UIImageView(frame: CGRect(x:0, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgOne.image = UIImage(named: "page1")
        let imgTwo = UIImageView(frame: CGRect(x:scrollViewWidth, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgTwo.image = UIImage(named: "page2")
        let imgThree = UIImageView(frame: CGRect(x:scrollViewWidth*2, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgThree.image = UIImage(named: "page3")
        let imgFour = UIImageView(frame: CGRect(x:scrollViewWidth*3, y:0,width:scrollViewWidth, height:scrollViewHeight))
        imgFour.image = UIImage(named: "page4")
        
        self.scrollView.addSubview(imgOne)
        self.scrollView.addSubview(imgTwo)
        self.scrollView.addSubview(imgThree)
        self.scrollView.addSubview(imgFour)
        //4
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.width * 3, height:self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.pageControl.currentPage = 0
      self.pageControl.backgroundColor = UIColor.clear
        //2
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
   
    @IBAction func btn_LoginClick(_ sender: UIButton)
    {
        //Home screen
        UserDefaults.standard.bool(forKey: "afterlogin")
        UserDefaults.standard.set(true, forKey: "afterlogin")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let left = storyboard.instantiateViewController(withIdentifier: "left")
        let middle = storyboard.instantiateViewController(withIdentifier: "middle")
        let right = storyboard.instantiateViewController(withIdentifier: "right")
        let top = storyboard.instantiateViewController(withIdentifier: "top")
       // let bottom = storyboard.instantiateViewController(withIdentifier: "bottom")
        
        let snapContainer = SnapContainerViewController.containerViewWith(left,
                                                                          middleVC: middle,
                                                                          rightVC: right,
                                                                          topVC: top)
        
        let navigationController = UINavigationController(rootViewController: snapContainer)
        navigationController.isNavigationBarHidden = true
       
         self.appDelegate.window?.rootViewController = navigationController
         self.appDelegate.window?.makeKeyAndVisible()
    }
    
    
    @IBAction func btn_SignUPClick(_ sender: UIButton)
    {
        //Home screen
        UserDefaults.standard.bool(forKey: "afterlogin")
        UserDefaults.standard.set(true, forKey: "afterlogin")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let left = storyboard.instantiateViewController(withIdentifier: "left")
        let middle = storyboard.instantiateViewController(withIdentifier: "middle")
        let right = storyboard.instantiateViewController(withIdentifier: "right")
        let top = storyboard.instantiateViewController(withIdentifier: "top")
        //let bottom = storyboard.instantiateViewController(withIdentifier: "bottom")
        
        let snapContainer = SnapContainerViewController.containerViewWith(left,
                                                                          middleVC: middle,
                                                                          rightVC: right,
                                                                          topVC: top)
        let navigationController = UINavigationController(rootViewController: snapContainer)
        navigationController.isNavigationBarHidden = true
        
        self.appDelegate.window?.rootViewController = navigationController
        self.appDelegate.window?.makeKeyAndVisible()
    }

    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        // Test the offset and calculate the current page after scrolling ends
        let pageWidth:CGFloat = scrollView.frame.width
        let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
        // Change the indicator
        self.pageControl.currentPage = Int(currentPage);
        // Change the text accordingly
        if Int(currentPage) == 0{
        }else if Int(currentPage) == 1{
        }else if Int(currentPage) == 2{
        }else{
            // Show the "Let's Start" button in the last slide (with a fade in animation)
            UIView.animate(withDuration: 1.0, animations: { () -> Void in
               // self.startButton.alpha = 1.0
            })
        }
    }

    
}
