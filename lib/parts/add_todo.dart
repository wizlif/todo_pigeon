part of '../todos_page.dart';

class AddTodoForm extends StatefulWidget {
  final Future Function(String, String) addTodo;
  const AddTodoForm({super.key, required this.addTodo});

  @override
  State<AddTodoForm> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _titleController;
  late final TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey();
    _titleController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text('Add Todo'),
            const SizedBox(height: 15),
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Title required';
                }
    
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message'),
              minLines: 5,
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Message required';
                }
    
                return null;
              },
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Spacer(),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState?.validate() == true) {
                      await widget.addTodo(
                        _titleController.text,
                        _messageController.text,
                      );
                    }
                  },
                  child: const Text('Save'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
