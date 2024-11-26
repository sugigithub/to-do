import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'id': '1',
        'title': 'Notification',
        'icon': 'notifications_on_sharp',
        'screen': 'notification'
      },
      {
        'id': '2',
        'title': 'Security',
        'icon': 'security_outlined',
        'screen': 'notification'
      },
      {
        'id': '3',
        'title': 'Help Center',
        'icon': 'live_help_outlined',
        'screen': 'notification'
      },
      {
        'id': '4',
        'title': 'Go Premium',
        'icon': 'workspace_premium_sharp',
        'screen': 'notification'
      },
    ];

    // Map of icon names to IconData
    final Map<String, IconData> iconMapping = {
      'notifications_on_sharp': Icons.notifications_on_sharp,
      'security_outlined': Icons.security_outlined,
      'live_help_outlined': Icons.live_help_outlined,
      'workspace_premium_sharp': Icons.workspace_premium_sharp,
    };

    IconData getIcon(String iconName) {
      return iconMapping[iconName] ?? Icons.help_outline; // Fallback icon
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('New Task'),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text('data'),
                        Text('data'),
                      ],
                    ),
                    SizedBox(width: 16),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTkL_zpTULJ9oHSTLYX2iaSAeeCxoPUi3hWKQ&s'),
                    ),
                    SizedBox(width: 16),
                    Column(
                      children: [
                        Text('data'),
                        Text('data'),
                      ],
                    ),
                  ],
                ),
                const Text('data'),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  child: const Text('Software Engineer'),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Text(
                        'Software Engineer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
            SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7)),
                            padding: const EdgeInsets.all(10),
                            child: Icon(getIcon(items[index]['icon']!)),
                          ),
                          Text(items[index]['title']!),
                          const Icon(Icons.chevron_right),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Text('data'),
            const Text('data'),
          ],
        ),
      ),
    );
  }
}
