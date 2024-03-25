
import 'package:provider/provider.dart';

import '../providers/bottom.dart';

final providers = [
  ChangeNotifierProvider<BottomNotifier>(
      create: ((context) => BottomNotifier())),
];
