/* "count": 51,
"pages": 3,
"next": "https://rickandmortyapi.com/api/episode?page=2",
"prev": null */

class Info {
  int count;
  int pages;
  String? next;
  String? prev;

  Info(
      {required this.count,
      required this.pages,
      this.next,
      this.prev});
}
