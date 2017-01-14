//
//  SecondViewController.swift
//  CampPolyHikes
//
//  Created by Charnpreet Singh on 1/14/17.
//  Copyright © 2017 Josh Choi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var imageLabel: UILabel!
    
    @IBOutlet var backOutlet: UIButton!
    @IBOutlet var nextOutlet: UIButton!
    var imageInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageInt = 1
        imageLabel.text = String("\(imageInt)/3")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backButton(_ sender: Any) {
        imageInt -= 1
        imageLabel.text = String("\(imageInt)/3")
        self.imageGallery()
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        imageInt += 1
        imageLabel.text = String("\(imageInt)/3")
        self.imageGallery()
    }
    
    func imageGallery() {
        if imageInt == 1 {
            backOutlet.isEnabled = false
            imageView.image = UIImage(named: "image1.jpg")
        }
        if imageInt == 2 {
            backOutlet.isEnabled = true
            nextOutlet.isEnabled = true
            imageView.image = UIImage(named: "image2.jpg")
        }
        if imageInt == 3 {
            nextOutlet.isEnabled = false
            imageView.image = UIImage(named: "image3.png")
        }

    }
}
