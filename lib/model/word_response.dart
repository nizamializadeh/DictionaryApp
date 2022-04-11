// To parse this JSON data, do
//
//     final wordResponse = wordResponseFromJson(jsonString);

import 'dart:convert';

List<WordResponse> wordResponseFromJson(String str) => List<WordResponse>.from(
    json.decode(str).map((x) => WordResponse.fromJson(x)));

String wordResponseToJson(List<WordResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordResponse {
  WordResponse({required this.word, required this.meanings});

  String word;
  List<Meaning> meanings;

  factory WordResponse.fromJson(Map<String, dynamic> json) => WordResponse(
        word: json["word"],
        meanings: List<Meaning>.from(
            json["meanings"].map((x) => Meaning.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
      };
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  String partOfSpeech;
  List<Definition> definitions;

  factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    required this.definition,
  });

  String definition;

  factory Definition.fromJson(Map<String, dynamic> json) =>
      Definition(definition: json['definition']);

  Map<String, dynamic> toJson() => {
        "definition": definition,
      };
}
