class CategoryMovies {
  final String name;
  final String categoryId;

  static List<CategoryMovies> categoryList = [
    CategoryMovies(name: 'Action', categoryId: 'Action'),
    CategoryMovies(name: 'Adventure', categoryId: 'Adventure'),
    CategoryMovies(name: 'Animation', categoryId: 'Animation'),
    CategoryMovies(name: 'Anime', categoryId: 'Anime'),
    CategoryMovies(name: 'Comedy', categoryId: 'Comedy'),
    CategoryMovies(name: 'Crime', categoryId: 'Crime'),
    CategoryMovies(name: 'Documentary', categoryId: 'Documentary'),
    CategoryMovies(name: 'Drama', categoryId: 'Drama'),
    CategoryMovies(name: 'Family', categoryId: 'Family'),
    CategoryMovies(name: 'Fantasy', categoryId: 'Fantasy'),
    CategoryMovies(name: 'Game Show', categoryId: 'Game Show'),
    CategoryMovies(name: 'Horror', categoryId: 'Horror'),
    CategoryMovies(name: 'Lifestyle', categoryId: 'Lifestyle'),
    CategoryMovies(name: 'Music', categoryId: 'Music'),
    CategoryMovies(name: 'Musical', categoryId: 'Musical'),
    CategoryMovies(name: 'Mystery', categoryId: 'Mystery'),
    CategoryMovies(name: 'Reality TV', categoryId: 'Reality TV'),
    CategoryMovies(name: 'Romance', categoryId: 'Romance'),
    CategoryMovies(name: 'Sci-Fi', categoryId: 'Sci-Fi'),
    CategoryMovies(name: 'Seasonal', categoryId: 'Seasonal'),
    CategoryMovies(name: 'Short', categoryId: 'Short'),
    CategoryMovies(name: 'Sport', categoryId: 'Sport'),
    CategoryMovies(name: 'Thriller', categoryId: 'Thriller'),
    CategoryMovies(name: 'Western', categoryId: 'Western'),
  ];

  CategoryMovies({required this.name, required this.categoryId});
}