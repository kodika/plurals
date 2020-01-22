# Plurals
A framework for generating the plural form of any particular English noun

# Usage

1. In your Podfile, include `pod Plurals` and run `pod install`
1. At the top of the file where you intend to use the library, include `import Plurals`
2. "person".plural()    //returns "people"

# Contribution
If you notice that a rule is missing from this library, please submit a pull request including the regex rule to the library.
* Plural words that do not change when they become plural are stored in the "unchanging" array, sorted alphabetically for clairity
* Rules are applied using [Regex](https://www.rexegg.com/regex-quickstart.html)
* Each rule is a tuple that lists the detection pattern and then the intended result pattern.
  * Ex: ("(pe)rson$",	"$1ople") -> Look for a word that contains the word "people", then convert that part of the word to "people"; "Businessperson".plural() // returns "Businesspeople"
* Rules are (loosly) sorted based on how commonly the rules are applied: 
  * Rules that intend to mutate only a few exceptional words are listed first 
    * Ex: tooth -> teeth
  * Rules that are generally applied are listed later
    * Ex: adding "es" to words that end in "ch"
* Critiques and comments encouraged, especually if they are bundled with a solution!
