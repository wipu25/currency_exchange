import 'package:currency_exchange/services/global_widget_service.dart';
import 'package:flutter/material.dart';

class MenuSideBar extends StatelessWidget {
  final bool isExpand;
  final Function()? expandMenu;
  final Function(MenuSelect) selectedMenu;
  final MenuSelect menuSelect;
  const MenuSideBar(
      {Key? key,
      required this.isExpand,
      this.expandMenu,
      required this.menuSelect,
      required this.selectedMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      width: isExpand ? 220 : 80,
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            isExpand ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          itemMenu(Icons.currency_exchange, MenuSelect.exchanges),
          itemMenu(Icons.calculate_outlined, MenuSelect.calculate),
          itemMenu(Icons.format_list_bulleted_outlined, MenuSelect.history),
          //TODO: will continue later
          // itemMenu(Icons.auto_graph, MenuSelect.sales),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isExpand ? 28 : 0, vertical: 12),
            child: GestureDetector(
                onTap: expandMenu,
                child: Icon(
                  isExpand
                      ? Icons.arrow_back_ios_outlined
                      : Icons.arrow_forward_ios_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }

  Widget itemMenu(IconData icon, MenuSelect itemMenu) {
    final isCurrentMenu = menuSelect == itemMenu;
    return GestureDetector(
      onTap: isCurrentMenu
          ? null
          : () {
              selectedMenu.call(itemMenu);
            },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isCurrentMenu ? Colors.white : Colors.blueAccent,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(
              vertical: 40, horizontal: isExpand ? 24 : 12),
          child: Row(
            mainAxisAlignment:
                isExpand ? MainAxisAlignment.start : MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isCurrentMenu ? Colors.blueAccent : Colors.white,
              ),
              if (isExpand)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      itemMenu.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isCurrentMenu ? Colors.blueAccent : Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
