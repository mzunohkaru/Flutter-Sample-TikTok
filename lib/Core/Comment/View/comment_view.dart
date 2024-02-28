import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tiktok_clone/Core/Comment/ViewModel/comment_view_model.dart';
import 'package:tiktok_clone/Core/Components/circular_profile_image_view.dart';
import 'package:tiktok_clone/Model/Post/post.dart';
import 'package:tiktok_clone/Repository/PostProvider/post_comment_provider.dart';
import 'package:tiktok_clone/Utils/constants.dart';
import 'package:tiktok_clone/Utils/format_date.dart';

class CommentView extends HookConsumerWidget {
  final Post post;
  final viewModel = CommentViewModel();
  CommentView({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentStream = ref.watch(postCommentNotifierProvider(post.postId));

    final commentController = useTextEditingController();
    final isValidation = useState(false);

    useEffect(() {
      void listener() {
        isValidation.value = commentController.text.isNotEmpty;
      }

      commentController.addListener(listener);
      return () {
        commentController.removeListener(listener);
      };
    }, [commentController]);

    void reset() {
      commentController.clear();
      FocusScope.of(context).unfocus();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: commentStream.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('エラー: $error')),
            data: (comments) {
              if (comments.isEmpty) {
                return const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.post_add,
                        size: 80,
                      ),
                      Text(
                        "No Comments",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Let me make my first comment.",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 10,
                  ),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      final comment = comments[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
                          children: [
                            CircularProfileImageView(
                                profileImageUrl: comment.user!.profileImageUrl,
                                radius: 22),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.user!.username,
                                  style: kUsernameTextStyle,
                                ),
                                Text(comment.commentText),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              formatDate(comment.createAt),
                              style: kSubTextStyle,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: commentController,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none),
                      filled: true,
                      labelText: "Comment..",
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: isValidation.value ? Colors.blue : Colors.grey,
                ),
                onPressed: isValidation.value
                    ? () async {
                        await viewModel.comment(
                            ref: ref,
                            post: post,
                            commentText: commentController.text);
                        reset();
                      }
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
