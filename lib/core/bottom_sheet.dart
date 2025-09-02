import '../project_setup.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget Function(BuildContext, void Function(Future<T> Function())) builder,
    bool isDarkTheme = false,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true, // allows full height scrollable sheet
      backgroundColor: isDarkTheme ? ColorResource.blackColor : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) {
        return _BottomSheetContent<T>(
          builder: builder,
        );
      },
    );
  }
}

class _BottomSheetContent<T> extends StatefulWidget {
  final Widget Function(BuildContext, void Function(Future<T> Function())) builder;

  const _BottomSheetContent({required this.builder});

  @override
  State<_BottomSheetContent<T>> createState() => _BottomSheetContentState<T>();
}

class _BottomSheetContentState<T> extends State<_BottomSheetContent<T>> {
  bool _isLoading = false;

  /// Call this function inside child when submitting
  void _submit(Future<T> Function() action) async {
    setState(() => _isLoading = true);
    try {
      final result = await action();
      if (mounted) Navigator.of(context).pop(result); // return result to caller
    } catch (e) {
      debugPrint("BottomSheet error: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom, // push above keyboard
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            widget.builder(context, _submit),
            if (_isLoading)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
