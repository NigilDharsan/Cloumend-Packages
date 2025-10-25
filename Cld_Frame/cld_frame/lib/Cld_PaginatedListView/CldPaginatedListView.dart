import 'package:flutter/material.dart';

class CldPaginatedListView extends StatefulWidget {
  final ScrollController scrollController;
  final Future<void> Function(int offset) onPaginate;
  final int? totalSize;
  final int? offset;
  final int pageSize;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;

  const CldPaginatedListView({
    Key? key,
    required this.scrollController,
    required this.onPaginate,
    required this.totalSize,
    required this.offset,
    required this.itemBuilder,
    required this.itemCount,
    this.pageSize = 10,
  }) : super(key: key);

  @override
  State<CldPaginatedListView> createState() => _CldPaginatedListViewState();
}

class _CldPaginatedListViewState extends State<CldPaginatedListView> {
  late int _offset;
  List<int>? _offsetList;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _offset = widget.offset ?? 1;
    _offsetList = List.generate(_offset, (index) => index + 1);

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent &&
          widget.totalSize != null &&
          !_isLoading) {
        if (mounted) {
          _paginate();
        }
      }
    });
  }

  void _paginate() async {
    int pageCount = (widget.totalSize! / widget.pageSize).ceil();
    if (_offset < pageCount && !_offsetList!.contains(_offset + 1)) {
      setState(() {
        _offset += 1;
        _offsetList!.add(_offset);
        _isLoading = true;
      });

      await widget.onPaginate(_offset);

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: widget.itemCount + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= widget.itemCount) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return widget.itemBuilder(context, index);
      },
    );
  }
}
