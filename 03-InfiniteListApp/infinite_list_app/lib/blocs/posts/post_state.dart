import 'package:equatable/equatable.dart';
import 'package:infinitelistapp/data/posts/models/post_model.dart';

/*
PostUninitialized- will tell the presentation layer it needs to render a loading
                   indicator while the initial batch of posts are loaded.

PostLoaded- will tell the presentation layer it has content to render.

posts- will be the List<PostModel> which will be displayed.

hasReachedMax- will tell the presentation layer whether or not it has reached
               the maximum number of posts.

PostError- will tell the presentation layer that an error has occurred
           while fetching posts.
 */

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostUninitialized extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
  final List<PostModel> posts;
  final bool hasReachedMax;

  const PostLoaded({
    this.posts,
    this.hasReachedMax,
  });

  PostLoaded copyWith({
    List<PostModel> posts,
    bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() =>
      'PostLoaded { posts : ${posts.length}, hasreachedMax: $hasReachedMax }';
}
