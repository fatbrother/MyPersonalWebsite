class Repo {
  String? name;
  String? url;
  String? description;
  String? language;
  DateTime lastUpdate = DateTime(0);

  Repo.fromMap(Map<String, dynamic> map) {
    name = map.containsKey('name') ? map['name'] : '';
    url = map.containsKey('html_url') ? map['html_url'] : '';
    description = map.containsKey('description') ? map['description'] : '';
    language = map.containsKey('language') ? map['language'] : '';
    lastUpdate = map.containsKey('updated_at')
        ? DateTime.parse(map['updated_at'])
        : DateTime(0);
  }
}
