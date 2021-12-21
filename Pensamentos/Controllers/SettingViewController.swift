//
//  SettingViewController.swift
//  Pensamentos
//
//  Created by Luana Martinez de La Flor on 17/09/21.
//

import UIKit

class SettingViewController: UIViewController {

    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    let config = Configuration.shared
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh") , object: nil, queue: nil) { (notification) in
            
            self.formatView()
            
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        formatView()
        
    }
    
    func formatView(){
        swAutorefresh.setOn(config.autoRefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = config.colorScheme
        chargeTimeIntervalLabel(with: config.timeInterval)
        } // configura a paginas com os parametris "Salvos"
    
    func chargeTimeIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar apos \(Int(value)) segundos"
        
        
    }
    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn // set os valores na percistencia 
    }
    
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value) )
        chargeTimeIntervalLabel(with: value) // configura a tela
        config.timeInterval = value // manda para persistencia
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
    }
    
    

}
