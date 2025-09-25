import 'package:flutter/material.dart';
import 'activity_service.dart';
import 'activity_form.dart';
import 'activity_model.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final ActivityService _service = ActivityService();
  late Future<List<ActivityModel>> _futureActivities;

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  void _loadActivities() {
    _futureActivities = _service.getActivities();
  }

  Future<void> _addActivity(ActivityModel activity) async {
    await _service.addActivity(activity);
    setState(() {
      _loadActivities(); // refrescar después de guardar
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EcoTrack 🌍")),
      body: FutureBuilder<List<ActivityModel>>(
        future: _futureActivities,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          final activities = snapshot.data ?? [];
          if (activities.isEmpty) {
            return const Center(child: Text("No hay actividades registradas"));
          }
          return ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              return ListTile(
                title: Text(activity.type),
                subtitle: Text(
                  "CO₂: ${activity.co2Kg} kg - Fecha: ${activity.date.toLocal()}",
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => ActivityForm(onSave: _addActivity),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
