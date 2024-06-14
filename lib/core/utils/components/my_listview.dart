import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'loading.dart';

class MyListView<T> extends StatefulWidget {
  const MyListView({
    super.key,
    required this.fetchData,
    required this.list,
    required this.noMoreData,
    required this.itemBuilder,
    this.physics,
    this.isGrid = false,
    this.crossAxisCount = 2,
    this.crossAxisSpacing = 4,
    this.mainAxisSpacing = 18,
    this.childAspectRatio = 9 / 15,
    this.myWidget,
    this.withoutPagination = false,
    this.scrollDirection = Axis.vertical,
  });

  final bool isGrid;
  final Function fetchData;
  final List<T> list;
  final bool noMoreData;
  final Widget Function(BuildContext context, T item) itemBuilder;
  final ScrollPhysics? physics;
  final Widget? myWidget;

  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final bool withoutPagination;
  final Axis scrollDirection;

  @override
  State<MyListView<T>> createState() => _MyListViewState<T>();
}

class _MyListViewState<T> extends State<MyListView<T>> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  void _onRefresh() async {
    await widget.fetchData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Reached the end of the list
        widget.withoutPagination ? null : widget.fetchData();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isGrid ? buildGridView() : buildListView();
  }

  Widget buildListView() {
    return SmartRefresher(
      controller: _refreshController,
      header: const WaterDropHeader(),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView(
        shrinkWrap: true,
        controller: _scrollController,
        physics: widget.physics ?? const BouncingScrollPhysics(),
        scrollDirection: widget.scrollDirection,
        children: [
          widget.myWidget ?? const SizedBox(),
          // Items
          ...List<Widget>.from(
            widget.list.map(
              (item) => Builder(
                builder: (context) => widget.itemBuilder(context, item),
              ),
            ),
          ),
          // Add Loading (circular progress indicator at the end),
          // if there are more items to be loaded
          if (widget.noMoreData) ...[
            const SizedBox(),
          ] else ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: DefaultLoading(),
            ),
          ]
        ],
      ),
    );
  }

  Widget buildGridView() {
    return SmartRefresher(
      controller: _refreshController,
      header: const WaterDropHeader(),
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: GridView.builder(
        shrinkWrap: true,
        controller: _scrollController,
        physics: widget.physics ?? const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: widget.crossAxisSpacing,
          mainAxisSpacing: widget.mainAxisSpacing,
          childAspectRatio: widget.childAspectRatio,
        ),
        itemBuilder: (context, index) {
          // Items
          if (index < widget.list.length) {
            return Builder(
              builder: (context) =>
                  widget.itemBuilder(context, widget.list[index]),
            );
          }
          return null;
        },
      ),
    );
  }
}
