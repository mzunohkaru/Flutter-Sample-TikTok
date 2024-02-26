// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postCommentNotifierHash() =>
    r'c832d129a141b80bf8a906386b7ff25b793db9d0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$PostCommentNotifier
    extends BuildlessAutoDisposeStreamNotifier<List<Comment>> {
  late final dynamic postId;

  Stream<List<Comment>> build(
    dynamic postId,
  );
}

/// See also [PostCommentNotifier].
@ProviderFor(PostCommentNotifier)
const postCommentNotifierProvider = PostCommentNotifierFamily();

/// See also [PostCommentNotifier].
class PostCommentNotifierFamily extends Family<AsyncValue<List<Comment>>> {
  /// See also [PostCommentNotifier].
  const PostCommentNotifierFamily();

  /// See also [PostCommentNotifier].
  PostCommentNotifierProvider call(
    dynamic postId,
  ) {
    return PostCommentNotifierProvider(
      postId,
    );
  }

  @override
  PostCommentNotifierProvider getProviderOverride(
    covariant PostCommentNotifierProvider provider,
  ) {
    return call(
      provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postCommentNotifierProvider';
}

/// See also [PostCommentNotifier].
class PostCommentNotifierProvider extends AutoDisposeStreamNotifierProviderImpl<
    PostCommentNotifier, List<Comment>> {
  /// See also [PostCommentNotifier].
  PostCommentNotifierProvider(
    dynamic postId,
  ) : this._internal(
          () => PostCommentNotifier()..postId = postId,
          from: postCommentNotifierProvider,
          name: r'postCommentNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCommentNotifierHash,
          dependencies: PostCommentNotifierFamily._dependencies,
          allTransitiveDependencies:
              PostCommentNotifierFamily._allTransitiveDependencies,
          postId: postId,
        );

  PostCommentNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final dynamic postId;

  @override
  Stream<List<Comment>> runNotifierBuild(
    covariant PostCommentNotifier notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(PostCommentNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostCommentNotifierProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<PostCommentNotifier, List<Comment>>
      createElement() {
    return _PostCommentNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCommentNotifierProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostCommentNotifierRef
    on AutoDisposeStreamNotifierProviderRef<List<Comment>> {
  /// The parameter `postId` of this provider.
  dynamic get postId;
}

class _PostCommentNotifierProviderElement
    extends AutoDisposeStreamNotifierProviderElement<PostCommentNotifier,
        List<Comment>> with PostCommentNotifierRef {
  _PostCommentNotifierProviderElement(super.provider);

  @override
  dynamic get postId => (origin as PostCommentNotifierProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
