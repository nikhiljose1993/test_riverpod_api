import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod_api/models/Post.dart';
import 'package:test_riverpod_api/services/api_service.dart';

final postsProvider = FutureProvider<List<Post>>(
  (ref) => ref.read(apiProvider).fetchPosts(),
);
