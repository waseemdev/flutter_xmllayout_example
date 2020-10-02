import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

typedef LoadMore = Future Function();

typedef OnLoadMore = void Function();

typedef ItemCount = int Function();

typedef HasMore = bool Function();

typedef OnLoadMoreFinished = void Function();

/// A list view that can be used for incrementally loading items when the user scrolls.
/// This is an extension of the ListView widget that uses the ListView.builder constructor.
class InfiniteListView extends StatefulWidget {
  /// A callback that indicates if the collection associated with the ListView has more items that should be loaded
  final HasMore hasMore;

  /// A callback to an asynchronous function that would load more items
  final LoadMore loadMore;

  /// Determines when the list view should attempt to load more items based on of the index of the item is scrolling into view
  /// This is relative to the bottom of the list and has a default value of 0 so that it loads when the last item within the list view scrolls into view.
  /// As an example, setting this to 1 would attempt to load more items when the second last item within the list view scrolls into view
  final int loadMoreOffsetFromBottom;
  final Key key2;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController controller;
  final bool primary;
  final ScrollPhysics physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final double itemExtent;
  final IndexedWidgetBuilder itemBuilder;
  final AnimatedListItemBuilder animatedItemBuilder;
  final ItemCount itemCount;
  final Widget bottomWidget;
  final Widget topWidget;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final double cacheExtent;
  final SliverGridDelegate gridDelegate;
  final int gridCrossAxisCount;

  /// A callback that is triggered when more items are being loaded
  final OnLoadMore onLoadMore;

  /// A callback that is triggered when items have finished being loaded
  final OnLoadMoreFinished onLoadMoreFinished;

  InfiniteListView(
      {@required this.hasMore,
      @required this.loadMore,
      this.loadMoreOffsetFromBottom = 0,
      this.key2,
      this.scrollDirection = Axis.vertical,
      this.reverse = false,
      this.controller,
      this.primary,
      this.physics,
      this.shrinkWrap = false,
      this.padding,
      this.itemExtent,
      this.itemBuilder,
      @required this.itemCount,
      this.animatedItemBuilder,
      this.bottomWidget,
      this.topWidget,
      this.gridDelegate,
      this.gridCrossAxisCount,
      this.addAutomaticKeepAlives = true,
      this.addRepaintBoundaries = true,
      this.cacheExtent,
      this.onLoadMore,
      this.onLoadMoreFinished});

  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  bool _loadingMore = false;
  final PublishSubject<bool> _loadingMoreSubject = PublishSubject<bool>();
  Stream<bool> _loadingMoreStream;

  _InfiniteListViewState() {
    _loadingMoreStream =
        _loadingMoreSubject.switchMap((shouldLoadMore) => loadMore());
  }

  int _additionalWidgetsCount() {
    int res = widget.bottomWidget == null ? 0 : 1;
    res += widget.topWidget == null ? 0 : 1;
    return res;
  }

  int _itemCount() {
    return widget.itemCount() + _additionalWidgetsCount();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _loadingMoreStream,
        builder: (context, snapshot) {
            return _buildListView();
        });
  }

  Widget _buildListView() {
    return ListView.builder(
      key: widget.key2,
      controller: widget.controller,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      primary: widget.primary,
      physics: widget.physics,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      itemExtent: widget.itemExtent,
      itemCount: _itemCount(),
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      cacheExtent: widget.cacheExtent,
      itemBuilder: _itemBuilder
    );
  }

  Widget _itemBuilder(itemBuilderContext, index) {
    // if (widget.startAtIndex.value > -1) {
      // index += widget.startAtIndex.value;

    //   if (index == widget.startAtIndex.itemsCount - _additionalWidgetsCount()) {
    //     widget.startAtIndex.value = -1;
    //   }
    // }
    if (!_loadingMore &&
        index == _itemCount() - widget.loadMoreOffsetFromBottom - _additionalWidgetsCount() &&
        widget.hasMore()) {
      _loadingMore = true;
      _loadingMoreSubject.add(true);
    }

    if (!_loadingMore && index == 0 && widget.topWidget != null) {
      return widget.topWidget;
    }

    if (index == _itemCount() - _additionalWidgetsCount() + (widget.topWidget != null ? 1 : 0)) {
      if (_loadingMore) {
        return widget.bottomWidget;
      }
      return null;
    }

    // decrement index
    index -= !_loadingMore && widget.topWidget != null ? 1 : 0;
    
    return widget.itemBuilder(itemBuilderContext, index);
  }

  Stream<bool> loadMore() async* {
    yield _loadingMore;
    if (widget.onLoadMore != null) {
      widget.onLoadMore();
    }
    await widget.loadMore();
    _loadingMore = false;
    yield _loadingMore;
    if (widget.onLoadMoreFinished != null) {
      widget.onLoadMoreFinished();
    }
  }

  @override
  void dispose() {
    _loadingMoreSubject.close();
    super.dispose();
  }
}