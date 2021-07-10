extension ExtensionProvider on Map<String, dynamic> {
  dynamic getValue(String key) => this.containsKey(key) ? this[key] : null;
}