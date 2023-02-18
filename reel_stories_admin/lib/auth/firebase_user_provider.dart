import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ReelStoriesAdminFirebaseUser {
  ReelStoriesAdminFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ReelStoriesAdminFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ReelStoriesAdminFirebaseUser> reelStoriesAdminFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ReelStoriesAdminFirebaseUser>(
      (user) {
        currentUser = ReelStoriesAdminFirebaseUser(user);
        return currentUser!;
      },
    );
