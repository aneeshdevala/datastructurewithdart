import 'dart:collection';


class Trie {
  //dynamic suffixTree = HashMap();
  TrieNode root = TrieNode();
  String endSymbol = '*';
  Trie(String str) {
    suffixTree(str);
  }
  void suffixTree(String str) {
    for (int i = 0; i < str.length; i++) {
      insertSubstringStartingAt(i, str);
    }
  }

  void insertSubstringStartingAt(int index, String str) {
    TrieNode node = root;
    for (int i = index; i < str.length; i++) {
      String letter = str[i];
      //if the letter is not contains in the map its work
      if (!node.children.containsKey(letter)) {
        TrieNode newNode = TrieNode();
        node.children.putIfAbsent(letter, () => newNode);
      }
      //if the letter is contains in thier the method will be work

      node = node.children[letter]!;
    }
    node.children.putIfAbsent(endSymbol, () => TrieNode());
  }

  //searching the word
  bool? contains(String str) {
    TrieNode node = root;
    for (int i = 0; i < str.length; i++) {
      String letter = str[i];
      if (!node.children.containsKey(letter)) {
        return false;
      }
      node = node.children[letter]!;
    }
    return node.children.containsKey(endSymbol);
  }
}

class TrieNode {
  Map<String, TrieNode> children = HashMap();
}
