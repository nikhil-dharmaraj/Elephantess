//
//  PopoverViewController.swift
//  Elephantess
//
//  Created by Nikhil Dharmaraj on 3/25/18.
//  Copyright © 2018 Nikhil Dharmaraj. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    var part: Int = 0

    @IBAction func done(_ sender: Any) {
        self.presentingViewController!.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet var top: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if (part == 0) {
            text.text = "At the heart of the DSWT’s conservation activities is the Orphans’ Project, which has achieved world-wide acclaim through its hugely successful elephant and rhino rescue and rehabilitation program. The Orphans’ Project exists to offer hope for the future of Kenya’s threatened elephant and rhino populations as they struggle against the threat of poaching for their ivory and horn, and the loss of habitat due to human population pressures and conflict, deforestation and drought. To date the David Sheldrick Wildlife Trust has successfully hand-raised over 150 infant elephants and has accomplished its long-term conservation priority by effectively reintegrating orphans back into the wild herds of Tsavo, claiming many healthy wild-born calves from former-orphaned elephants raised in our care."
            top.text = "The Orphans' Project"
        }
        else if (part == 1) {
            text.text = "When a tiny new-born elephant is orphaned, it is often because its mother and family have been killed to serve the brutal ivory trade. For an elephant, family is all important; a calf’s very existence depends upon its mother's milk for the first two years of life. In Kenya an Elephant Nursery exists nestled within Nairobi National Park under the auspices of the David Sheldrick Wildlife Trust, which is overseen by Dr Dame Daphne Sheldrick, whose elephant experience spans a lifetime. This pioneering organisation, which works in partnership with the Kenya Wildlife Service offers hope for any orphaned elephant fortunate enough to be found alive."
            top.text = "First Stages of Recovery"
        }
        else if (part == 2) {
            text.text = "Rescued orphaned infant elephants arrive at the Trust’s Nairobi Nursery severely traumatised by the events that have caused the separation from their mother and family by more often than not extreme circumstances. Aside from the trauma and shock from such events the infant inevitably enters a period of deep grieving for its lost loved ones, which can last for months. During this critical period survival hangs in the balance and not all calves can be persuaded to make the effort to try to live. The Nairobi Nursery offers a secure base and a loving environment to nurture these orphans at a time of greatest need."
            top.text = "Critical Period"
        }
        else if (part == 3) {
            text.text = "It took Daphne Sheldrick nearly three decades of trial and error to perfect the milk formula and complex husbandry necessary to rear an orphaned infant African elephant yet today, with support from many caring people world-wide, the David Sheldrick Wildlife Trust is proud to have saved over 150 orphaned infant calves, which would otherwise have perished. More importantly, every one of these orphans can look forward to a quality of life in wild terms, living free in Tsavo East National Park protected by their new extended orphaned family and friends amongst the wild herds."
            top.text = "DSWT Accomplishments"
        }
        else if (part == 4) {
            text.text = "Elephants, more than any other species need S-P-A-C-E. The Tsavo National Park is the only Park in Kenya large enough to accommodate sizeable numbers in perpetuity. Where confined in smaller areas, elephants are at risk, for Nature never intended that they stay in one small patch for too long due to the impact they have on the vegetation. Also, Nature has made them a fragile species; the first to be adversely affected by drought and lack of adequate browse."
            top.text = "On Elephant Needs"
        }
        else if (part == 5) {
            text.text = "Given that they are highly intelligent, highly sophisticated, long-lived animals with an emotional make-up akin to our own, a sense of self , their sense of family, sense of death and their needs, the management and the survival of the African Elephant as a species presents the greatest challenge to the Range States today. In dealing with this species, and as we approach the second millennium, humane treatment, welfare of individuals and most especially, their quality of life, must come beneath the spotlight of world opinion. It is simply not acceptable to view them in monetary terms an a mere commodity, with no thought given to the above issues."
            top.text = "Elephants Are Not Commodities"
        }
        // Do any additional setup after loading the view.
    }

    @IBOutlet var text: UITextView!
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

}
