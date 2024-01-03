import 'package:currency_exchange/services/global_widget_service.dart';
import 'package:flutter/material.dart';

class MenuSideBar extends StatefulWidget {
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
  State<MenuSideBar> createState() => _MenuSideBarState();
}

class _MenuSideBarState extends State<MenuSideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      width: widget.isExpand ? 220 : 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: widget.isExpand
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            itemMenu(Icons.currency_exchange, MenuSelect.exchanges),
            itemMenu(Icons.calculate_outlined, MenuSelect.calculate),
            itemMenu(Icons.format_list_bulleted_outlined, MenuSelect.history),
            //TODO: will continue later
            // itemMenu(Icons.auto_graph, MenuSelect.sales),
            const Spacer(),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: widget.isExpand ? 28 : 0),
              child: GestureDetector(
                  onTap: widget.expandMenu,
                  child: const Icon(Icons.arrow_forward_ios_outlined)),
            )
          ],
        ),
      ),
    );
  }

  Widget itemMenu(IconData icon, MenuSelect itemMenu) {
    final isCurrentMenu = widget.menuSelect == itemMenu;
    return Material(
      color: isCurrentMenu ? Colors.white : Colors.blueAccent,
      child: InkWell(
        onTap: isCurrentMenu
            ? null
            : () {
                widget.selectedMenu.call(itemMenu);
              },
        child: Container(
          height: 120,
          padding: EdgeInsets.symmetric(
              vertical: 8.0, horizontal: widget.isExpand ? 24 : 12),
          child: Row(
            mainAxisAlignment: widget.isExpand
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(icon),
              if (widget.isExpand)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      itemMenu.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
