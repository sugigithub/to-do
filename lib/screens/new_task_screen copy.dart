// import 'package:flutter/material.dart';
// import 'package:todo_app/models/category.dart';
// import 'package:todo_app/models/task.dart';
// import 'package:todo_app/providers/task_provider.dart';
// import 'package:todo_app/widgets/category_tag.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NewTaskScreen extends ConsumerStatefulWidget {
//   const NewTaskScreen({super.key});

//   @override
//   ConsumerState<NewTaskScreen> createState() {
//     return _NewTaskState();
//   }
// }

// class _NewTaskState extends ConsumerState<NewTaskScreen> {
//   DateTime? _selectedDate;

//   void _presentDatePicker() async {
//     final now = DateTime.now();
//     final firstDate = DateTime(now.year - 1, now.month, now.day);
//     final pickedDate = await showDatePicker(
//       context: context,
//       initialDate: now,
//       firstDate: firstDate,
//       lastDate: now,
//     );
//     setState(() {
//       _selectedDate = pickedDate;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('New Task'),
//       // ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'New Task',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 10),
//             const TextField(
//               decoration: InputDecoration(
//                 label: Text('Title'),
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               decoration: const InputDecoration(
//                 label: Text('Due Date'),
//                 border: OutlineInputBorder(),
//               ),
//               readOnly: true,
//               onTap: _presentDatePicker,
//               controller: TextEditingController(
//                 text: _selectedDate?.toString() ?? '',
//               ),
//             ),
//             const SizedBox(height: 10),
//             const TextField(
//               maxLines: null, // Allow unlimited lines
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 label: Text('Description'),
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter your text here',
//               ),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Select Category',
//               style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//             ),
//             const Wrap(
//               spacing: 8,
//               children: [
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//                 CategoryTag(),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Row(
//               children: [
//                 const Text(
//                   'Get alert for this task',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//                 Expanded(
//                   child: SwitchListTile(
//                     value: true,
//                     onChanged: (value) => false,
//                   ),
//                 )
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(taskProvider.notifier).addTask(Task(
//                       title: "last task of the day",
//                       description: 'complete it no matter what',
//                       category: Category.dailyRoutine,
//                       percentageCompletion: 60,
//                     ));
//               },
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius:
//                       BorderRadius.circular(10.0), // Adjust radius as needed
//                 ),
//                 minimumSize: const Size(double.infinity, 50),
//                 backgroundColor: Colors.orange,
//               ),
//               child: Text(
//                 'Create Task',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 17,
//                     color: Colors.black.withOpacity(0.6)),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
