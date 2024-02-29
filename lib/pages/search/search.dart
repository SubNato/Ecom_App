import 'package:ecom_app/pages/search/bloc/search_blocs.dart';
import 'package:ecom_app/pages/search/bloc/search_states.dart';
import 'package:ecom_app/pages/search/widgets/search_widgets.dart';
import 'package:ecom_app/widgets/base_text_widget.dart' as reuse;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../entities/values/colors.dart';
import '../../entities/values/constant.dart';
import '../../routes/names.dart';
import 'my_search_controller.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late MySearchController _searchController;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _searchController = MySearchController(context: context);
    _searchController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBlocs, SearchStates>(builder: (context, state){
      return Scaffold(
        appBar: reuse.buildAppBar("Search"),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              sliver: SliverToBoxAdapter(     //So that you can add a widget to sliver, as it doesn't accept usually.
                child: reuse.searchView(context, "Courses You Might Like!", home: false),
              ),
            ),
            SliverPadding(padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0),
            sliver: SliverToBoxAdapter(
              child: SingleChildScrollView(

                child: searchList(state),
              ),
            ),
            )
          ],
        ),
      );
    });
  }
}
