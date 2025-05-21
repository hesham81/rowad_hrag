part of 'blog_cubit.dart';

sealed class BlogState {
  const BlogState();
}

class BlogHandling extends BlogState {
  const BlogHandling();
}

class BlogInitial extends BlogHandling {
  const BlogInitial();
}

class BlogLoaded extends BlogHandling {
  final List<Blog> blogs;

  const BlogLoaded(this.blogs);
}

class BlogError extends BlogHandling {
  final String message;

  const BlogError(this.message);

}
