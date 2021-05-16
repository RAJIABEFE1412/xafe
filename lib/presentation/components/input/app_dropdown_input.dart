// import 'package:flutter/material.dart';
// import 'package:xafe/utils/modals.dart';
// import 'package:xafe/utils/type_defs.dart';

// import 'app_text_field.dart';

// class XafeDropdownInput<T> extends StatefulWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final OnValidate<String> validator;
//   final List<T> items;
//   final OnChanged<int> onChanged;

//   XafeDropdownInput(
//     this.controller, {
//     this.hintText = "Dropdown",
//     this.validator,
//     this.items,
//     this.onChanged,
//   }) : assert(controller != null);

//   @override
//   State<StatefulWidget> createState() => _XafeDropdownInputState<T>();
// }

// class _XafeDropdownInputState<T> extends State<XafeDropdownInput> {
//   TextEditingController _localCtrl;

//   @override
//   void initState() {
//     super.initState();
//     _populateCtrl();
//   }

//   void _populateCtrl() {
//     if (widget.controller != null &&
//         widget.controller.text != null &&
//         widget.controller.text.isNotEmpty) {
//       final selection = widget?.items?.firstWhere(
//           (it) => it.selection == widget.controller.text,
//           orElse: () => null);
//       _localCtrl = TextEditingController(text: selection?.title);
//     }
//     _localCtrl = TextEditingController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         return InkWell(
//           onTap: () async {
//             FocusScope.of(context).requestFocus(FocusNode());
//             showSelectionSheet(
//               context,
//               title: widget.hintText,
//               data: widget.items,
//               onSelect: (data) {
//                 widget.controller.text = data.selection;
//                 _localCtrl.text = data.title;
//                 if (widget.onChanged != null) {
//                   widget.onChanged(widget.items.indexOf(data));
//                 }
//               },
//             );
//           },
//           child: XafeTextField(
//             isEnabled: false,
//             controller: _localCtrl,
//             hintText: widget.hintText,
//             validator: widget.validator,
//             suffixIcon: Icon(Icons.keyboard_arrow_down),
//           ),
//         );
//       },
//     );
//   }
// }


