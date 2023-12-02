import 'package:flutter/material.dart';

class ChangeReaction extends StatefulWidget {
  const ChangeReaction({Key? key}) : super(key: key);

  @override
  _ChangeReactionState createState() => _ChangeReactionState();
}

class _ChangeReactionState extends State<ChangeReaction> {
  bool isLiked = false;
  String selectedReaction = reactions.keys.first;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('Like');
      },
      child: SizedBox(
        height: 45.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Text(
                reactions[selectedReaction]!,
                style: TextStyle(
                  color: isLiked ? Colors.blue : null,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                _toggleLike();
                _showReactions();
              },
            ),
            const SizedBox(width: 4.0),
            const Text('like'),
            const SizedBox(width: 4.0),
          ],
        ),
      ),
    );
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void _showReactions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: reactions.length,
            itemBuilder: (BuildContext context, int index) {
              String reactionName = reactions.keys.elementAt(index);
              String reactionIcon = reactions[reactionName]!;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedReaction = reactionName;
                  });
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  backgroundColor: selectedReaction == reactionName
                      ? Colors.blue[100]
                      : Colors.grey[300],
                  child: Text(
                    reactionIcon,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

Map<String, String> reactions = {
  'Like': '👍',
  'Love': '❤️',
  'Haha': '😄',
  'Wow': '😮',
  'Sad': '😢',
  'Angry': '😡',
  'Care': '🥺',
};
