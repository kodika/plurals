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
		//words that don't follow the rules
		let exceptions: [(String, String)] = [
			("photo", 	"photos"),
			("piano", 	"pianos"),
			("halo", 	"halos"),
			("goose", 	"geese"),
			("tooth", 	"teeth"),
			("foot", 	"feet"),
			("mouse", 	"mice"),
			("person", 	"people"),
			("die", 	"dice"),
			("louse",	"lice"),
			("ox",		"oxen"),
		]
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
			("^*(m)an$", 					"$1en"),		//man 				-> men
			("^*(c)hild$", 					"$1hildren"),	//child 			-> children
			("(.{2,})us$", 					"$1i"),			//cactus 			-> cacti
			("sis$", 						"$1ses"),		//analysis 			-> analyses
			("(.*)on$", 					"$1a"),			//phenomenon 		-> phenomena
			("(.*[^aeiou])y$",				"$1ies"),		//city				-> cities
			("^(roof|belief|chef|chief)$",	"$1s"),			//exceptions to 'f 	-> ves'
			("(.*)(f|fe)$",					"$1ves"),		//knife 			-> knives
			("(.*o|s|x|z|sh|ss|ch)$", 		"$1es"),
		]


		//check if the word does not change in its plural form
		if unchanging.contains(self) {
			return self
		}

		//evaluate if there is a match in the exeptions
		//if so, return the plural
		for (exception, plural) in exceptions {
			guard self == exception else { continue }
				return plural
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


