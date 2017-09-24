//
//  ViewController.swift
//  RazorpaySwift
//
//  Created by Harsh Thakkar on 24/09/17.
//  Copyright © 2017 Harsh Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {
    
    private var razorpay: Razorpay!
    @IBOutlet weak var payButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        payButton.layer.cornerRadius = 2.0
        
        // Setup razorpay
        setupRazorpay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func payWithRazorpay(_ sender: UIButton) {
        // Call payment gateway
        showPaymentForm()
    }
    
    func setupRazorpay () {
        // Initialize Razorpay with public key
        razorpay = Razorpay.initWithKey("razorpay_public_key", andDelegate: self)
    }
    
    func showPaymentForm () {
        let options = [
            "amount": "100",
            "order_id": "order_aD32zjq7",
            "theme": [
                "color": "#F37254"
            ]
        ] as [String : Any]
        razorpay.open(options)
    }
    
    // On payment success
    func onPaymentSuccess(_ payment_id: String) {
        UIAlertView.init(title: "Payment Successful", message: payment_id, delegate: self, cancelButtonTitle: "OK").show()
    }
    
    // On payment error
    func onPaymentError(_ code: Int32, description str: String) {
        UIAlertView.init(title: "Error", message: str, delegate: self, cancelButtonTitle: "OK").show()
    }

}

