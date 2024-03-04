import 'package:d_demo/core/utils/extensions.dart';
import 'package:d_demo/feature/language/manager/localizatios.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../domain/entity/budget_category.dart';
import 'package:flutter/material.dart';

class BudgetCategoryItemWidget extends StatelessWidget {
  final BudgetCategory? item;
  final Function()? onAddNewItem;
  const BudgetCategoryItemWidget._({
    required this.item,
    required this.onAddNewItem,
  });

  factory BudgetCategoryItemWidget.item(BudgetCategory item) =>
      BudgetCategoryItemWidget._(
        item: item,
        onAddNewItem: null,
      );

  factory BudgetCategoryItemWidget.addNewItem(Function() onAddNewItem) =>
      BudgetCategoryItemWidget._(
        item: null,
        onAddNewItem: onAddNewItem,
      );

  @override
  Widget build(BuildContext context) {
    return _isAddNewItem ? _addNewItemWidget : _itemWidget;
  }

  Widget get _itemWidget => Builder(
        builder: (context) => Container(
          width: double.infinity,
          height: _height,
          margin: const EdgeInsets.symmetric(vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: MColors.cardColor,
            borderRadius: BorderRadius.circular(UiUtils.borderRadius),
            border: Border.all(
              width: 1,
              color: MColors.progressBackgroundColor,
            ),
          ),
          child: Column(
            children: [
              Expanded(child: _infoWidget),
              _progressWidget,
            ],
          ),
        ),
      );

  Widget get _infoWidget => Builder(
        builder: (context) => Row(
          children: [
            _iconWidget,
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item?.name ?? '-',
                    style: MTextStyle.boldTitleStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    Strings.of(context).left_to_spend_place_holder.replaceFirst(
                          '\$0',
                          item?.getLeftAmount.toCurrency ?? '-',
                        ),
                    style: MTextStyle.subTitle2Style,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${item?.amount?.toCurrency ?? '-'}',
                  style: MTextStyle.boldTitleStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  Strings.of(context).of_dollar_place_holder.replaceFirst(
                        '\$0',
                        item?.total?.toCurrency ?? '-',
                      ),
                  style: MTextStyle.subTitle2Style,
                ),
              ],
            )
          ],
        ),
      );

  Widget get _iconWidget => Builder(
        builder: (context) => SizedBox.square(
          dimension: 36,
          child: Icon(
            item?.icon?.toIcon,
            size: 24,
            color: MColors.notSelectedTextColor,
          ),
        ),
      );

  Widget get _progressWidget => Builder(
        builder: (context) => Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 4,
          child: LinearProgressIndicator(
            backgroundColor: MColors.progressBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            value: item?.getPercent,
            valueColor: AlwaysStoppedAnimation<Color>(
              item?.color?.toColor ?? MColors.primaryColor,
            ),
          ),
        ),
      );

  Widget get _addNewItemWidget => Builder(
        builder: (context) => Container(
          width: double.infinity,
          height: _height,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(UiUtils.borderRadius),
              onTap: onAddNewItem,
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(UiUtils.borderRadius),
                color: MColors.progressBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        Strings.of(context).add_new_budget_category,
                        style: MTextStyle.title2Style,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _plusWidget,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _plusWidget => Builder(
        builder: (context) => Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1.5,
              color: MColors.notSelectedTextColor,
            ),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Fonts.plus,
            size: 8,
            color: MColors.notSelectedTextColor,
          ),
        ),
      );

  bool get _isAddNewItem => onAddNewItem != null && item == null;

  double get _height => 80;
}
