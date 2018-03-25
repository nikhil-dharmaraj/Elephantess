//
//  OrphansViewController.swift
//  Elephantess
//
//  Created by Nikhil Dharmaraj on 3/24/18.
//  Copyright © 2018 Nikhil Dharmaraj. All rights reserved.
//

import UIKit
import Foundation
import PassKit
import CSV
import Stripe

class OrphansViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet var nextBut: UIButton!
    @IBOutlet weak var reason: UILabel!
    @IBOutlet weak var locfound: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var arrivage: UILabel!
    @IBOutlet weak var dateborn: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet var prevBut: UIButton!
    @IBOutlet var fosterBut: UIButton!
    var num = 1
    var ellyName = ""
    let SupportedPaymentNetworks = [PKPaymentNetwork.visa, PKPaymentNetwork.masterCard, PKPaymentNetwork.amex]
    let ApplePaySwagMerchantID = "merchant.com.elephantess.applePayGift" // Fill in your merchant ID here!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.clipsToBounds = true
        fillLabels()
        // Do any additional setup after loading the view.
    }

    @IBAction func donatePushed(_ sender: Any) {
        let request = PKPaymentRequest()
        request.merchantIdentifier = ApplePaySwagMerchantID
        request.supportedNetworks = SupportedPaymentNetworks
        request.merchantCapabilities = PKMerchantCapability.capability3DS
        request.countryCode = "US"
        request.currencyCode = "USD"
        request.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "1-Year Fostering" + ellyName, amount: 50),
            PKPaymentSummaryItem(label: "David Sheldrick Wildlife Trust", amount: 50)
        ]
        let applePayController = PKPaymentAuthorizationViewController(paymentRequest: request)
        applePayController?.delegate = self
        self.present(applePayController!, animated: true, completion: nil)
    }
    @IBAction func nextPushed(_ sender: Any) {
        fillLabels()
    }
    
    @IBAction func prevPushed(_ sender: Any) {
        num = num - 2
        fillLabels()
    }
    
    func disableNext() {
        nextBut.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillLabels() {
        if (num == 1) {
            prevBut.isEnabled = false
        }
        else {
            prevBut.isEnabled = true
        }
        let row = getCSVData()[num]
        ellyName = row[0]
        self.imageView.image = UIImage(named:ellyName.lowercased().trimmingCharacters(in: .whitespaces))
        fosterBut.setTitle("Foster" + ellyName + " with Apple Pay!", for: UIControlState.normal)
        name.text = ellyName
        category.text = "Category: " + row[1]
        gender.text = "Gender: " + row[2]
        dateborn.text = "Date Born: " + row[3]
        locfound.text = "Location Found: " + row[4]
        arrivage.text = "Age at Arrival: " + row[5]
        reason.text = "Reason for Orphanage: " + row[7]
        comments.text = "Notes: " + row[6]
        num = num + 1
        if (num >= getCSVData().count)
        {
            nextBut.isEnabled = false
        }
    }
    
    func getCSVData() -> [[String]]{
        let path:String = Bundle.main.path(forResource: "datafinal", ofType: "csv")!
        let stream = InputStream(fileAtPath: path)!
        let csv = try! CSVReader(stream: stream)
        var arr = [[String]]()
        while let row = csv.next() {
            arr.append(row)
        }
        return arr
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

extension OrphansViewController: PKPaymentAuthorizationViewControllerDelegate {
    func paymentAuthorizationViewController(_ controller: PKPaymentAuthorizationViewController, didAuthorizePayment payment: PKPayment, completion: @escaping ((PKPaymentAuthorizationStatus) -> Void)) {
        // 2
        Stripe.setDefaultPublishableKey("pk_test_P6vfhJpPIEmwiDkCIa4RtyA2")  // Replace With Your Own Key!
        
        // 3
        STPAPIClient.shared().createToken(with: payment) {
            (token, error) -> Void in
            
            if (error != nil) {
                print(error)
                completion(PKPaymentAuthorizationStatus.failure)
                return
            }
            // 5
            var request = URLRequest(url: URL(string: "http://172.24.6.177/pay")!)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            // 6
            let body = ["stripeToken": token?.tokenId,
                        "amount": 50.00,
                        "description": "1-Year Fostering" + self.ellyName,
                        ] as [String : Any]
            
           do{
                try request.httpBody = JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions())
            }
            catch {
            }
            // 7
            URLSession.shared.dataTask(with: request as URLRequest){data, response, err in
                if (err != nil) {
                    completion(PKPaymentAuthorizationStatus.failure)
                }
                else {
                    completion(PKPaymentAuthorizationStatus.success)
                }
                }.resume()
        }
    
    }
    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

