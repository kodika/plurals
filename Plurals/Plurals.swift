//
//  Plurals.swift
//  Plurals
//
//  Created by Ike Mattice on 1/3/20.
//  Copyright © 2020 Ike Mattice. All rights reserved.
//

import Foundation


extension String {
	public func plural() -> String {
		let unchanging: [String] = [
			"aircraft",
			"bison",
			"corps",
			"deer",
			"fish",
			"means",
			"moose",
			"offspring",
			"salmon",
			"scissors",
			"series",
			"sheep",
			"species",
			"swine",
			"trout",
		]

		let rules: [(String, String)] = [
			///Exceptions
			//exceptions are compared against the current spellings on https://www.merriam-webster.com;
			//words with multiple acceptable spellings are not considered exeptional
			//this is probably not exhaustive.  If you find a word (or a few) that should be added, please submit a pull request
			//in an effort to keep these organized, they are loosely sorted alphabetically of their pluralized ending
			("^(woof|roof|belief|chef|chief)$",                         "$1s"),                 //exceptions to 'f  -> ves'
			("^(alg|vertebr|vit|alumn|nebul)a$",                        "$1ae"),                //vertebra          -> vertebrae
			("^(ox)$",                                                  "$1en"),                //ox                -> oxen
			("(ax)is$",													"$1es"),				//axis				-> axes
			("^(apparat)us$", 											"$1uses"),				//apparatus 		-> apparatuses
			("^(b|tabl)eau$", 											"$1eaux"),				//tableau 			-> tableaux
			("(g)oose$",												"$1eese"),				//goose				-> geese
			("(f)oot$",													"$1eet"),				//foot				-> feet
			("(t)ooth$",												"$1eeth"),				//tooth				-> teeth
			("^(th)is$", 												"$1ese"),				//this 				-> these
			("^(gen)us$", 												"$1era"),				//genus 			-> genera
			("(alumn|bacill|fung|radi|stimul)us$",						"$1i"),					//fungus 			-> fungi
			("(m|l)ouse$",												"$1ice"),				//mouse				-> mice
			("^(d)ie$",													"$1ice"),				//die				-> dice
			("^(ind|append)ex$", 										"$1ices"),				//index 			-> indices
			("^(append|matr)ix$", 										"$1ices"),				//matrix 			-> matrices
			("(phot|pian|tac)o$",										"$1os"),				//photo				-> photos
			("(vet|torped|her|ech|embarg)o$",							"$1oes"),				//mosquito			-> mosquitoes
			("^(corp)us$",												"$1ora"),				//corpus			-> corpora
			("^(th)at$", 												"$1ose"),				//that 				-> those
			("sis$", 													"$1ses"),				//analysis 			-> analyses
            ("(foc|cact)us",                                            "$1i"),                 //focus             -> foci || cactus -> cacti
            ("(phenomen|criteri)on",                                    "$1a"),                 //phenomenon        -> phenomena || criterion -> criteria

			///General Rules
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


