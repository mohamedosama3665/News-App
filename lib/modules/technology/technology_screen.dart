import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class TechnologyScreen extends StatefulWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  _TechnologyScreenState createState() => _TechnologyScreenState();
}

class _TechnologyScreenState extends State<TechnologyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).technology;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildArticleItem(list[index], context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: 12),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
