import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> signInWithEmail(String email, String password) async {
  SupabaseClient supabase = Supabase.instance.client;
  final AuthResponse res = await supabase.auth.signInWithPassword(email: email, password: password);
}
