import 'package:supabase/supabase.dart';

// const supabaseUrl = String.fromEnvironment('supabaseUrl');
// const supabaseKey = String.fromEnvironment('supabaseKey');

const supabaseUrl = "https://aujfoiojxxuykoxqyynx.supabase.co";
const supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYyODE4Njk2MCwiZXhwIjoxOTQzNzYyOTYwfQ.omIXJrMLlKxqYlKO5T9YAiqAyk5pOh9vjD3cOR_1PPA";

final client = SupabaseClient(supabaseUrl, supabaseKey);
