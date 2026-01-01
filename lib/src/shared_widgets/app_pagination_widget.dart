import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'fade_circle_loading_indicator.dart';

class AppPaginationWidget extends StatefulWidget {
  const AppPaginationWidget({
    super.key,
    required this.child,
    required this.onLoading,
    this.enableLoadingOnScrollStart = false,
    this.enablePullDown = false,
    this.onRefresh,
  });
  final Widget child;
  final Future<bool> Function(int page) onLoading;
  final Future<bool> Function()? onRefresh;

  final bool enableLoadingOnScrollStart;
  final bool enablePullDown;

  @override
  State<AppPaginationWidget> createState() => _AppPaginationWidgetState();
}

class _AppPaginationWidgetState extends State<AppPaginationWidget> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  int _page = 1;

  Future<void> _onLoading() async {
    _page++;
    if (await widget.onLoading(_page)) {
      debugPrint("loading Another Page complete");
      _refreshController.loadComplete();
    } else {
      debugPrint("loading Another Page No DATa");

      _refreshController.loadNoData();
    }
  }

  Future<void> _onRefresh() async {
    if (await widget.onRefresh!()) {
      _refreshController.refreshCompleted();
    } else {
      _refreshController.refreshFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollStartNotification>(
      onNotification: widget.enableLoadingOnScrollStart
          ? (notification) {
              if (notification.metrics.axisDirection == AxisDirection.down) {
                _onLoading();
                return true;
              }
              return false;
            }
          : null,
      child: SmartRefresher(
        enablePullDown: widget.enablePullDown,
        enablePullUp: true,
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            return SizedBox(
              height: 55.0,
              child: Center(
                child: mode == LoadStatus.loading
                    ? const FadeCircleLoadingIndicator()
                    : const SizedBox.shrink(),
              ),
            );
          },
        ),
        // header: CustomHeader(
        //   builder: (context, mode) {
        //     return SizedBox(
        //       height: 55.0,
        //       child: Center(
        //         child: mode == RefreshStatus.refreshing
        //             ? const Assets.images.animationLoading.image.adaptive()
        //             : const SizedBox.shrink(),
        //       ),
        //     );
        //   },
        // ),
        controller: _refreshController,
        onLoading: widget.enableLoadingOnScrollStart ? null : _onLoading,
        onRefresh: widget.enablePullDown ? _onRefresh : null,
        primary: false,
        child: widget.child,
      ),
    );
  }
}
