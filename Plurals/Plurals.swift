//
//  Plurals.swift
//  Plurals
//
//  Created by Ike Mattice on 1/3/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation


extension String {
	func plural() -> String {
		let unchanging: [String] = [
			"sheep",
			"series",
			"species",
			"deer",
			"aircraft",
			"deer",
			"fish",
			"moose",
			"offspring",
			"sheep",
			"species",
			"salmon",
			"trout",
			"swine",
			"bison",
			"corps",
			"means",
			"series",
			"scissors",
		]

		let rules: [(String, String)] = [
			///exceptions
			("^(roof|belief|chef|chief)$",	"$1s"),			//exceptions to 'f 	-> ves'
			("(ax)is$",						"$1es"),		//axis				-> axes
			("(phot|pian|hal)o$",			"$1os"),		//photo				-> photos
			("(g)oose$",					"$1eese"),		//goose				-> geese
			("(t)ooth$",					"$1eeth"),		//tooth				-> teeth
			("(f)oot$",						"$1eet"),		//foot				-> feet
			("(m)ouse$",					"$1ice"),		//mouse				-> mice
			("(pe)rson$",					"$1ople"),		//person			-> people
			("(d)ie$",						"$1ice"),		//die				-> dice
			("(l)ouse$",					"$1ice"),		//louse				-> lice
			("^(ox)$",						"$1en"),		//die				-> dice

			///special rules
			("^*(m)an$", 					"$1en"),		//man 				-> men
			("^*(c)hild$", 					"$1hildren"),	//child 			-> children
			("(.{2,})us$", 					"$1i"),			//cactus 			-> cacti

			///general rules
			("sis$", 						"$1ses"),		//analysis 			-> analyses
			("(.*)on$", 					"$1a"),			//phenomenon 		-> phenomena
			("(.*[^aeiou])y$",				"$1ies"),		//city				-> cities
			("(.*)(f|fe)$",					"$1ves"),		//knife 			-> knives
			("(.*o|s|x|z|sh|ss|ch)$", 		"$1es"),
		]

		//check if the word does not change in its plural form
		if unchanging.contains(self) {
			return self
		}

		//check through regex rules for which particular pluralization rule to apply
		for (pattern, template) in rules {
			guard let regexReplaced = self.replace(with: pattern, template: template) else { continue }
			if regexReplaced != "" && regexReplaced != self { return regexReplaced }
		}

		//If there isn't a rule or exception available, just add an "s" as the default
		return self + "s"
	}

	func replace(with pattern: String, template: String) -> String? {
		guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
			else { print("regex is invalid: \(pattern)"); return nil }

        let range = NSRange(location: 0, length: self.count)
        let output = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
        return output
    }
}


