import 'package:flutter/material.dart';

class ModalBottomSheetHelper {
  final Key? key;
  final String? title;
  final BuildContext? context;
  final Widget? child;
  final Widget? childFooter;
  final bool? enableDrag;
  final bool? useRootNavigator;
  final bool? isDismissible;
  final bool? showGoback;
  final Function? onTapBack;
  final Function? onTapClose;
  final Function? complete;
  final EdgeInsetsGeometry? padding;

  ModalBottomSheetHelper({
    this.key,
    this.title,
    required this.context,
    this.child,
    this.childFooter,
    this.enableDrag = false,
    this.useRootNavigator = false,
    this.isDismissible = true,
    this.showGoback = false,
    this.onTapBack,
    this.onTapClose,
    this.complete,
    this.padding,
  }) {
    showModalBottomSheet(
        context: context!,
        enableDrag: enableDrag!,
        isDismissible: isDismissible!,
        useRootNavigator: useRootNavigator!,
        clipBehavior: Clip.hardEdge,
        backgroundColor: Colors.transparent,
        barrierColor:
            Theme.of(context!).scaffoldBackgroundColor.withOpacity(0.5),
        isScrollControlled: true,
        useSafeArea: true,
        builder: (BuildContext context) {
          final double maxHeight = ((MediaQuery.of(context).size.height -
                  MediaQuery.of(context).viewPadding.top -
                  (title != null ? 60 + (childFooter != null ? 60 : 0) : 0)) -
              MediaQuery.of(context).viewInsets.bottom -
              MediaQuery.of(context).viewPadding.bottom);
          return Container(
            key: key,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SafeArea(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title != null)
                      Container(
                        key: const Key('title'),
                        color: Theme.of(context).appBarTheme.backgroundColor,
                        constraints: const BoxConstraints(
                          minHeight: 56,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: FractionallySizedBox(
                            widthFactor: 0.9,
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (showGoback!)
                                      InkWell(
                                        child: const Icon(
                                          Icons.arrow_back_ios,
                                        ),
                                        onTap: () {
                                          if (onTapBack != null) {
                                            onTapBack!();
                                          }
                                        },
                                      ),
                                    Expanded(
                                      child: SizedBox(
                                        width: constraints.maxWidth,
                                        child: Text(
                                          '$title',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                        .appBarTheme
                                                        .titleTextStyle
                                                        ?.color ??
                                                    Colors.white,
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: IconButton(
                                        enableFeedback: false,
                                        tooltip: 'Cerrar',
                                        icon: Icon(
                                          Icons.close_outlined,
                                          color: Theme.of(context)
                                                  .appBarTheme
                                                  .titleTextStyle
                                                  ?.color ??
                                              Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          if (onTapClose != null) onTapClose!();
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    Container(
                      key: const Key('children'),
                      color: Colors.white,
                      constraints: (maxHeight > 0)
                          ? BoxConstraints(
                              maxHeight: maxHeight,
                            )
                          : const BoxConstraints(),
                      width: double.infinity,
                      child: Container(
                        child: child,
                      ),
                    ),
                    if (childFooter != null)
                      Container(
                        key: const Key('footer'),
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.8),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: childFooter!,
                      )
                  ],
                ),
              ),
            ),
          );
        }).whenComplete(() {
      if (complete != null) complete!();
    });
  }
}
