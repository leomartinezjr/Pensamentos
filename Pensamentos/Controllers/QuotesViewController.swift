//
//  QuotesViewController.swift
//  Pensamentos
//
//  Created by Luana Martinez de La Flor on 17/09/21.
//

import UIKit

class QuotesViewController: UIViewController {

    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var ivPhotoBg: UIImageView!
    @IBOutlet weak var lbQuotes: UILabel!
    @IBOutlet weak var lbAutor: UILabel!
    
    @IBOutlet weak var ctTop: NSLayoutConstraint!
    
    let config = Configuration.shared
    let quotesManage = QuotesManage()
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh") , object: nil, queue: nil) { (notification) in
            
            self.formatview()
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatview()

        }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        prepareQuote()
    }
    
    func formatview() {
        view.backgroundColor = config.colorScheme == 0 ? .white : UIColor(red: 156.0/255.0, green: 68.0/255.0, blue: 15.0/255.0, alpha: 1.0) //  se no config for 0 (branco no slid) caso contraio set as outras cores
        lbQuotes.textColor = config.colorScheme == 0 ? .black : .white
        lbAutor.textColor = config.colorScheme == 0 ? UIColor(red: 192.0/255.0, green: 96.0/255.0, blue: 49.0/255.0, alpha: 1.0) : .yellow
        prepareQuote()
        
    }
    
    func prepareQuote(){
        timer?.invalidate() // invalida o time anterio
        
        if config.autoRefresh{ // se o config for truer, lembrando q pega das persistencias
            timer = Timer.scheduledTimer(withTimeInterval: config.timeInterval, repeats: true) { (timer) in
            self.showRamdomQuote() // a cada x tempo chama uma quote
        }
          
        }
        showRamdomQuote() // primeira quote
        
    }
    
    func showRamdomQuote(){
        let quote = quotesManage.getRadomQuotes()
        lbQuotes.text = quote.quote
        lbAutor.text = quote.author
        ivPhoto.image = UIImage(named: quote.image)
        ivPhotoBg.image = ivPhoto.image
        
        lbQuotes.alpha = 0.0
        lbAutor.alpha = 0.0
        ivPhoto.alpha = 0.0
        ivPhotoBg.alpha = 0.0
        ctTop.constant = 50
        view.layoutIfNeeded() //faz o layout atualiar as vier=w para usa a anumate
        
        UIView.animate(withDuration: 2.5) {
            self.lbQuotes.alpha = 1.0
            self.lbAutor.alpha = 1.0
            self.ivPhoto.alpha = 1.0
            self.ivPhotoBg.alpha = 0.25
            self.ctTop.constant = 10
            self.view.layoutIfNeeded() // faz o layout atualizar 
        }
        
        
        
    }
    
    }
    
    


