import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/states.dart';

// class BibleEngine extends StateNotifier<BibleState> {
//   BibleEngine()
//       : super(
//           BibleState(
//             book: 1,
//             chapter: 1,
//           ),
//         );

//   void update({
//     int? book,
//     int? chapter,
//   }) {
//     state = state.copyWith(
//       book: book ?? state.book,
//       chapter: chapter ?? 1,
//     );
//   }
// }

// class ShelfNotifier extends StateNotifier<int> {
//   ShelfNotifier() : super(0) {
//     state = tools!.getCurrBibleIndex();
//   }

//   update(int value) {
//     tools!.setCurrBible(value);
//     state = value;
//   }

//   List<String> get list {
//     return tools!.get_Shelf();
//   }
// }
