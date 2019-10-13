//
//  TableauController.swift
//  Lecteur YouTube
//
//  Created by damien on 23/05/2018.
//  Copyright © 2018 damien. All rights reserved.
//

import UIKit

class TableauController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var chansons = [Chanson]()
    var identifiantCell = "ChansonCell"
    var identifiantSegue = "VersVideo"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ajouterChanson()
        title = "Mes vidéos préférées"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chansons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let chanson = chansons[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifiantCell) as? ChansonCell {
            cell.creerCell(chanson)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chanson = chansons[indexPath.row]
        performSegue(withIdentifier: identifiantSegue, sender: chanson)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == identifiantSegue {
            if let nouveauController = segue.destination as? VideoController {
                nouveauController.chanson = sender as? Chanson
            }
        }
    }
    
    func ajouterChanson() {
        let philadelphia = Chanson(artiste: "Android Developer", titre: "Architecture Components", String: "QVMqCRs0BNA")
        chansons.append(philadelphia)
        let coldplay = Chanson(artiste: "Johnatan Harris", titre: "Drawing 3D hole", String: "31AAgOny2Ro")
        chansons.append(coldplay)
        let returnToForever = Chanson(artiste: "Return To Forever", titre: "Earth Juice", String: "H36EpZuJ57w")
        chansons.append(returnToForever)
        let jamiroquai = Chanson(artiste: "Jamiroquaï", titre: "Return of the Space Cowboy", String: "inyPruVpASs")
        chansons.append(jamiroquai)
        let justice = Chanson(artiste: "Justice", titre: "D.A.N.C.E. ", String: "tCnBrrnOefs")
        chansons.append(justice)
        let sade = Chanson(artiste: "Sade", titre: "Kiss Of Life", String: "lgwkXpgiYuE")
        chansons.append(sade)
        let depecheMode = Chanson(artiste: "Depeche Mode", titre: "Enjoy the Silence", String: "C9WtBo9b3WI")
        chansons.append(depecheMode)
        tableView.reloadData()

    }
}
