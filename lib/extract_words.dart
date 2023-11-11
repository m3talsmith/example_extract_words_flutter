// Create a function that takes an alphanumeric string and returns sorted alpha chunks.

// The function signature looks like:

// ```go
// func extractWords(data string) []string
// ```

// Example inputs/outputs:

// ```go
// extractWords("great1for235252anything") // []string{"anything", "for", "great"}
// extractWords("99bottles0of0beer8976on342the097wall") // []string{"beer", "bottles", "of", "on", "the", "wall"}
// ```

import 'dart:convert';
import 'dart:developer';

List<String> extractWords(String data) {
  List<String> words = [];
  String currentWord = "";
  for (var (i, r) in data.runes.indexed) {
    var letter = String.fromCharCode(r);
      var number = int.tryParse(letter);
      if (number != null) {
        if (currentWord.isNotEmpty) {
          words.add(currentWord);
          currentWord = "";
        }
        continue;
      }
      currentWord += letter;
      if (i >= data.runes.length - 1) {
        words.add(currentWord);
      }
  }
  words.sort();
  return words;
}