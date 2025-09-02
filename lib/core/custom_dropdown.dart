import '../project_setup.dart';

class CustomDropdown<T> extends StatefulWidget {
  final List<T> items; // can be String, int, Map, custom model etc.
  final T? value;
  final String hint;
  final double borderRadius;
  final Color borderColor;
  final IconData icon;
  final ValueChanged<T?> onChanged;

  /// Function to build custom widget for dropdown list items
  final Widget Function(BuildContext, T) itemBuilder;

  /// Optional function to decide how selected item should be displayed
  final String Function(T)? itemLabelBuilder;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    required this.itemBuilder,
    this.itemLabelBuilder,
    this.value,
    this.hint = "Select Item",
    this.borderRadius = 12,
    this.borderColor = Colors.grey,
    this.icon = Icons.arrow_drop_down,
  });

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  T? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 🔹 Full screen tap detector to close when clicking outside
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => _toggleDropdown(),
              child: Container(color: Colors.transparent),
            ),
          ),

          // 🔹 Actual dropdown
          Positioned(
            left: offset.dx,
            top: offset.dy + size.height + 5,
            width: size.width,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: widget.items.map((item) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedValue = item;
                        });
                        widget.onChanged(item);
                        _toggleDropdown(); // close after selection
                      },
                      child: widget.itemBuilder(context, item),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            border: Border.all(color: widget.borderColor),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue != null
                    ? (widget.itemLabelBuilder != null
                    ? widget.itemLabelBuilder!(selectedValue as T)
                    : selectedValue.toString())
                    : widget.hint,
                style: TextStyle(
                  color: selectedValue == null ? Colors.grey : Colors.black,
                ),
              ),
              Icon(widget.icon),
            ],
          ),
        ),
      ),
    );
  }
}
