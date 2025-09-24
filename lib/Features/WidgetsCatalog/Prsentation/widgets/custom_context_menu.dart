
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/scheduler.dart';
import '../../../../../Utilites/theme_helper.dart';

class CustomContextMenuExample extends StatelessWidget {
  const CustomContextMenuExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: 50.h,
          horizontal: 10.w,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ThemeClass.of(context).waiting,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              'Here you can press a long to appear the menu .',
              style: const TextStyle(fontSize: 18),
              contextMenuBuilder: (context, editableTextState) {
                final List<ContextMenuButtonItem>
                buttonItems = <ContextMenuButtonItem>[
                  ContextMenuButtonItem(
                    label: 'copy',
                    onPressed: () {
                      editableTextState.copySelection(
                        SelectionChangedCause.toolbar,
                      );
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('copied')));
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          editableTextState.userUpdateTextEditingValue(
                            editableTextState.textEditingValue.copyWith(
                              selection: TextSelection.collapsed(offset: 0),
                            ),
                            SelectionChangedCause.toolbar,
                          );                          editableTextState.hideToolbar();
                        });
                      });
                    },
                  ),
                  ContextMenuButtonItem(
                    label: 'share',
                    onPressed: () {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text('shared!')));
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          editableTextState.userUpdateTextEditingValue(
                            editableTextState.textEditingValue.copyWith(
                              selection: TextSelection.collapsed(offset: 0),
                            ),
                            SelectionChangedCause.toolbar,
                          );                          editableTextState.hideToolbar();
                        });
                      });
                    },
                  ),
                  ContextMenuButtonItem(
                    label: 'translate',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('translate progress...')),
                      );
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        Future.delayed(const Duration(milliseconds: 500), () {
                          editableTextState.userUpdateTextEditingValue(
                            editableTextState.textEditingValue.copyWith(
                              selection: TextSelection.collapsed(offset: 0),
                            ),
                            SelectionChangedCause.toolbar,
                          );                          editableTextState.hideToolbar();
                        });
                      });
                    },
                  ),
                  if (editableTextState.textEditingValue.text.isNotEmpty)
                    ContextMenuButtonItem(
                      label: 'select all',
                      onPressed: () {
                        editableTextState.selectAll(
                          SelectionChangedCause.toolbar,
                        );
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Future.delayed(const Duration(milliseconds: 800), () {
                            editableTextState.userUpdateTextEditingValue(
                              editableTextState.textEditingValue.copyWith(
                                selection: TextSelection.collapsed(offset: 0),
                              ),
                              SelectionChangedCause.toolbar,
                            );
                            editableTextState.hideToolbar();
                          });
                        });
                      },
                    ),
                ];

                if (Theme.of(context).platform == TargetPlatform.iOS ||
                    Theme.of(context).platform == TargetPlatform.macOS) {
                  return CupertinoContextMenu(
                    child: const Text('...'),
                    actions:
                    buttonItems.map((item) {
                      return CupertinoContextMenuAction(
                        onPressed: item.onPressed,
                        child: Text(item.label!),
                      );
                    }).toList(),
                  );
                } else {
                  return AdaptiveTextSelectionToolbar.buttonItems(
                    anchors: editableTextState.contextMenuAnchors,
                    buttonItems: buttonItems,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}