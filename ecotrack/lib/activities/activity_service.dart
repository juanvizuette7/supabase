import 'package:supabase_flutter/supabase_flutter.dart';
import 'activity_model.dart';

class ActivityService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<List<ActivityModel>> getActivities() async {
    final response = await supabase.from('activities').select();

    return (response as List)
        .map((json) => ActivityModel.fromJson(json))
        .toList();
  }

  Future<void> addActivity(ActivityModel activity) async {
    await supabase.from('activities').insert(activity.toJson());
  }
}
