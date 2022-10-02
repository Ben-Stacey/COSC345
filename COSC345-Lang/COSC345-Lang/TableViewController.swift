//
//  Leaderboards.swift
//  COSC345-Lang
//
//  Created by Liam Flynn on 12/08/22.
//

import UIKit

struct Player{
    var name: String
    var score: Int
}

class PlayerTableViewController: UITableViewController {
    let players = [
        Player(name: "Bruce", score: 5),
        Player(name: "Bob", score: 4),
        Player(name: "Brent", score: 3),
        Player(name: "Keith", score: 2),
        Player(name: "Rob", score: 1),
    ]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)

        let player = players[indexPath.row]
        cell.textLabel?.text = player.name + "   " + String(player.score)

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Leaderboard"
    }
}
