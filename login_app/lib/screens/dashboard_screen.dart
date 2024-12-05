import 'package:flutter/material.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/widgets/custom_button.dart';
import 'package:login_app/widgets/custom_textfield.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final TextEditingController _name1Controller = TextEditingController();
  final TextEditingController _name2Controller = TextEditingController();
  String result = '';

  void toast(title, res) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(result),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void calculateFlames() {
    String name1 = _name1Controller.text.trim().toLowerCase();
    String name2 = _name2Controller.text.trim().toLowerCase();
    if (name1.isEmpty || name2.isEmpty) {
      setState(() {
        result = "Please enter both names!";
        toast('Missing', result);
      });
      return;
    }

    if (name1 == name2) {
      setState(() {
        result = "Try different names";
        toast('No letters left', result);
      });
    } else {
      // Remove common characters
      for (int i = 0; i < name1.length; i++) {
        if (name2.contains(name1[i])) {
          name2 = name2.replaceFirst(name1[i], '');
          name1 = name1.replaceFirst(name1[i], '');
          i = -1; // Restart iteration
        }
      }
      int remainingCount = name1.length + name2.length;

      // Flames logic
      List<String> flames = [
        'Friends',
        'Love',
        'Affection',
        'Marriage',
        'Enemy',
        'Siblings'
      ];
      while (flames.length > 1) {
        int removeIndex = (remainingCount % flames.length) - 1;
        if (removeIndex >= 0) {
          flames.removeAt(removeIndex);
        } else {
          flames.removeLast();
        }
      }
      setState(() {
        result = flames.first;
        toast('Relationship', result);
      });
    }
  }

  @override
  void dispose() {
    _name1Controller.dispose();
    _name2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Flames',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: _name1Controller,
              label: 'Your Name',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _name2Controller,
              label: 'His/Her Name',
              icon: Icons.favorite,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Find',
              icon: Icons.search,
              onPressed: calculateFlames,
            ),
          ],
        ),
      ),
    );
  }
}
