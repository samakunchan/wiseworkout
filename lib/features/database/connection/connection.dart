import 'package:drift/drift.dart';

import 'package:wiseworkout/features/database/connection/shared.dart'
    if (dart.library.io) 'package:wiseworkout/features/database/connection/mobile.dart'
    if (dart.library.js_interop) 'package:wiseworkout/features/database/connection/web.dart'
    as impl;

QueryExecutor openConnection() => impl.openConnection();
