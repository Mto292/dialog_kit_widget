part of '../widget/dialog_kit_widget.dart';

/// Beli widgetin ggörünürlük durumunu değiştirmek için kullanılır
extension WidgetExtension on Widget {
  Future<T?> openSimpleDialog<T>({
    BuildContext? context,
    Color? barrierColor,
    bool? barrierDismissible,
    EdgeInsetsGeometry? padding,
  }) {
    return Dialog(
      child: Padding(
        padding: padding ?? const EdgeInsets.all(20),
        child: this,
      ),
    ).openDialog<T>(
      context: context,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
    );
  }

  Future<T?> openDialog<T>({
    BuildContext? context,
    bool? barrierDismissible,
    Color? barrierColor,
  }) {
    assert(context != null || DialogKitWidget._dialogKitContext != null);
    final ctx = context ?? DialogKitWidget._dialogKitContext!;
    return showDialog<T>(
      barrierDismissible: barrierDismissible ?? true,
      barrierColor: barrierColor ?? Colors.black45,
      context: ctx,
      builder: (BuildContext context) {
        return this;
      },
    );
  }

  Future<T?> openBottomSheet<T>({
    BuildContext? context,
    Color? barrierColor,
    Color? backgroundColor,
    bool? barrierDismissible,
    ShapeBorder? shape,
    BoxConstraints? constraints,
    bool? isScrollControlled,
    bool? useRootNavigator,
    bool? isDismissible,
    bool? enableDrag,
  }) {
    assert(context != null || DialogKitWidget._dialogKitContext != null);
    final ctx = context ?? DialogKitWidget._dialogKitContext!;
    return showModalBottomSheet<T>(
      context: ctx,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor,
      isScrollControlled: isScrollControlled ?? false,
      useRootNavigator: useRootNavigator ?? false,
      isDismissible: isDismissible ?? true,
      enableDrag: enableDrag ?? true,
      shape: shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
      constraints: constraints,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
