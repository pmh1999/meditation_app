import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/data/model/my_error.model.dart';
import 'package:meditation_app/data/model/topic.model.dart';
import 'package:meditation_app/data/topic_storage.dart';
import 'package:meditation_app/pages/reminders_page.dart';
import 'package:meditation_app/utils/theme.dart';
import 'package:meditation_app/widgets/reponsive_builder.dart';

final topicStorage = RemoteTopicStorage();

class TopicGrid extends StatelessWidget {
  const TopicGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: topicStorage.load(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text((snapshot.error as MyError).errorMessage),
          );
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final topics = snapshot.data!;
        return MasonryGridView.count(
          crossAxisCount: 2,
          itemCount: topics.length,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          itemBuilder: (context, index) {
            final topic = topics[index];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('$RemindersPage');
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: topic.bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LayoutBuilder(builder: (context, constraints) {
                      return SvgPicture.asset(
                        topic.thumbnail,
                        width: constraints.maxWidth,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        topics[index].title,
                        style: PrimaryFont.bold(
                                context.screenSize.shortestSide * 0.04)
                            .copyWith(color: topic.textColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
