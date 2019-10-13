//
//  MeteoController.swift
//  CodabeeMeteo
//
//  Created by damien on 07/06/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit
import MapKit
import Alamofire

class MeteoController: UIViewController {

    @IBOutlet weak var villeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var iconeTempActuel: UIImageView!
    @IBOutlet weak var descTempActuel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let previsionCellId = "PrevisionCell"
    
    var locationManager: CLLocationManager?
    var previsions = [Prevision]()
    var previsionJournalieres = [PrevisionJournaliere]()
    var enTrainDeRecupererLesDonnees = false
    var jour = UIColor(red: 0, green: 191 / 255, blue: 1, alpha: 1)
    var nuit = UIColor(red: 19 / 255, green: 24 / 255, blue: 98 / 255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceLocation()
        miseEnPlaceTableView()
    }
    
    func obtenirPrevisionsMeteo(latitude: Double, longitude: Double) {
        enTrainDeRecupererLesDonnees = true
        let urlDeBase = "https://api.openweathermap.org/data/2.5/forecast?"
        let latitude = "lat=" + String(latitude)
        let longitude = "&lon=" + String(longitude)
        let uniteEtLangue = "&units=metric&lang=fr"
        let cleApi = "&APPID=" + API
        let urlString = urlDeBase + latitude + longitude + uniteEtLangue + cleApi
        guard let url = URL(string: urlString) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let reponse = response.value as? [String: AnyObject] {
                if let infoVille = reponse["city"] as? [String:AnyObject] {
                    if let maVille = infoVille["name"] as? String {
                        self.villeLabel.text = maVille
                        if let liste = reponse["list"] as? NSArray {
                            for element in liste {
                                if let dict = element as? [String: AnyObject] {
                                    if let main = dict["main"] as? [String: AnyObject] {
                                        if let temp = main["temp"] as? Double {
                                            if let weather = dict["weather"] as? NSArray, weather.count > 0 {
                                                if let tempsActuel = weather[0] as? [String:AnyObject] {
                                                    if let desc = tempsActuel["description"] as? String {
                                                        if let icone = tempsActuel["icon"] as? String {
                                                            if let date = dict["dt_txt"] as? String {
                                                                let nouvellePrevision = Prevision(temperature: temp, date: date, icone: icone, desc: desc)
                                                                self.previsions.append(nouvellePrevision)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            // Recharger les donnees
                            self.miseEnPlaceValeurDuMoment()
                            self.obtenirPrevisionJournaliere()
                            //self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func miseEnPlaceValeurDuMoment() {
        if previsions.count > 0 {
            let tempActuel = previsions[0]
            temperatureLabel.text = String(tempActuel.temperature.convertirEnIntString())
            descTempActuel.text = tempActuel.desc
            ImageDownloader.obtenir.imageDepuis(tempActuel.icone, iconeTempActuel)
            if tempActuel.icone.contains("d") {
                view.backgroundColor = jour
            } else {
                view.backgroundColor = nuit
            }
        }
    }
    
    
    func obtenirPrevisionJournaliere() {
        
        var jour = ""
        var icone = ""
        var min = 0.0
        var max = 0.0
        var desc = ""
        
        for prevision in previsions {
            if prevision.jour != "" {
                if prevision.jour != jour {
                    if jour != "" {
                        let nouvellePrevision = PrevisionJournaliere(jour: jour, icone: icone, desc: desc, min: min, max: max)
                        previsionJournalieres.append(nouvellePrevision)
                    }
                    jour = prevision.jour
                    icone = prevision.icone
                    min = prevision.temperature
                    max = prevision.temperature
                    desc = prevision.desc
                }
            } else {
                if prevision.temperature > max {
                    max = prevision.temperature
                }
                
                if prevision.temperature < min {
                    min = prevision.temperature
                }
                
                if prevision.date.contains("12:") {
                    icone = prevision.icone
                    desc = prevision.desc
                }
            }
        }
        enTrainDeRecupererLesDonnees = false
        self.tableView.reloadData()
    }
    
    
    
    
}
