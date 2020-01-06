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
			///Exceptions
			//exceptions are compared against the current spellings on https://www.merriam-webster.com;
			//words with multiple acceptable spellings are not considered exeptional
			//in an effort to keep these organized, they are loosely sorted alphabetically of their pluralized ending
			("^(roof|belief|chef|chief)$",								"$1s"),					//exceptions to 'f 	-> ves'
			("^(alg|vertebr|vit|alumn|nebul)a$", 						"$1ae"),				//vertebra 			-> vertebrae
			("^(ox)$",													"$1en"),				//ox				-> oxen
			("(ax)is$",													"$1es"),				//axis				-> axes
			("^(b|tabl)eau$", 											"$1eaux"),				//tableau 			-> tableaux
			("(g)oose$",												"$1eese"),				//goose				-> geese
			("(f)oot$",													"$1eet"),				//foot				-> feet
			("(t)ooth$",												"$1eeth"),				//tooth				-> teeth
			("^(th)is$", 												"$1ese"),				//this 				-> these
			("^(gen)us$", 												"$1era"),				//genus 			-> genera
			("(.{2,})us$", 												"$1i"),					//cactus 			-> cacti
			("(m|l)ouse$",												"$1ice"),				//mouse				-> mice
			("^(d)ie$",													"$1ice"),				//die				-> dice
			("^(ind|append)ex$", 										"$1ices"),				//index 			-> indices
			("^(append|matr)ix$", 										"$1ices"),				//matrix 			-> matrices
			("(phot|pian|tac)o$",										"$1os"),				//photo				-> photos
			("(vet|torped|her|ech|embarg)o$",							"$1oes"),				//mosquito			-> mosquitoes
			("^(corp)us$",												"$1ora"),				//corpus			-> corpora
			("^(th)at$", 												"$1ose"),				//that 				-> those
			("sis$", 													"$1ses"),				//analysis 			-> analyses
			("^(apparat)us$", 											"$1uses"),				//apparatus 		-> apparatuses

			///General Rules
			("(.*)on$", 												"$1a"),					//phenomenon 		-> phenomena
			("(.*)(f|fe)$",												"$1ves"),				//knife 			-> knives
			("(.*s|x|z|sh|ss|ch)$", 									"$1es"),				//marsh				-> marshes
			("^*(m)an$", 												"$1en"),				//man 				-> men
			("ium$", 													"$1ia"),				//millenium 		-> millenia
			("(.*[^aeiou])y$",											"$1ies"),				//city				-> cities
			("(pe)rson$",												"$1ople"),				//person			-> people
			("^*(child)$", 												"$1ren"),				//child 			-> children
			("(.*aeiou{1,})o$",											"$1os"),				//zoo				-> zoos
			("(.*[^aeiou])o$",											"$1oes"),				//banjo				-> banjoes
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

	private func replace(with pattern: String, template: String) -> String? {
		guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
			else { print("regex is invalid: \(pattern)"); return nil }

        let range = NSRange(location: 0, length: self.count)
        let output = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
        return output
    }
}


