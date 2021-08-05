

// enum NewsCategory {
//   business,
//   entartainment,
//   general,
//   health,
//   science,
//   sport,
//   technology
// }

// enum NewsSort { relevancy, popularity, publishedAt }

// abstract class INewsApi {
//   String? topHeadLine(NewsCategory? category);
//   String? searchHeadLine(String? q);
// }

// class NewsApi extends INewsApi {
//   String? apiKey;
//   String? country;
//   NewsSort? sortBy;

//   /// 2-lettern ISO code
//   NewsApi({this.country = 'ng', this.sortBy = NewsSort.publishedAt});

//   /// Top headline category URL.
//   String get headLineUrl =>
//       'https://newsapi.org/v2/top-headlines?apiKey=${this.apiKey}&country=${this.country}&category=';

//   /// News Category
//   String? get _business => headLineUrl + 'business';
//   String? get _entartainment => headLineUrl + 'entartainment';
//   String? get _general => headLineUrl + 'general';
//   String? get _health => headLineUrl + 'health';
//   String? get _science => headLineUrl + 'science';
//   String? get _sport => headLineUrl + 'sport';
//   String? get _technology => headLineUrl + 'technology';

//   /// News Sorting
//   String? get _relevancy => '&sortBy=relevancy';
//   String? get _popularity => '&sortBy=popularity';
//   String? get _publishedAt => '&sortBy=publishedAt';

//   @override
//   String? topHeadLine(
//     NewsCategory? category,
//   ) {
//     switch (category) {
//       case NewsCategory.business:
//         return this._business!;
//       case NewsCategory.entartainment:
//         return this._entartainment!;
//       case NewsCategory.general:
//         return this._general!;
//       case NewsCategory.health:
//         return this._health!;
//       case NewsCategory.science:
//         return this._science!;
//       case NewsCategory.sport:
//         return this._sport!;
//       case NewsCategory.technology:
//         return this._technology!;
//       default:
//         return this._general!;
//     }
//   }

//   @override

//   /// Used to search through the news api
//   String? searchHeadLine(String? q) {
//     /// Search url
//     String? searchUrl =
//         'https://newsapi.org/v2/everything?apiKey=${this.apiKey}&country=${this.country}&q=' +
//             q!;
//     switch (this.sortBy) {
//       case NewsSort.relevancy:
//         return searchUrl + this._relevancy!;
//       case NewsSort.popularity:
//         return searchUrl + this._popularity!;
//       case NewsSort.publishedAt:
//         return searchUrl + this._publishedAt!;
//       default:
//         return searchUrl + this._publishedAt!;
//     }
//   }
// }

