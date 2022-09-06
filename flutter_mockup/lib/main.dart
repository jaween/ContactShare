import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: _ContactInfoMockup(),
      ),
    );
  }
}

class _ContactInfoMockup extends StatefulWidget {
  const _ContactInfoMockup({super.key});

  @override
  State<_ContactInfoMockup> createState() => _ContactInfoMockupState();
}

class _ContactInfoMockupState extends State<_ContactInfoMockup> {
  int _phoneCount = 0;
  int _emailCount = 0;
  int _socialCount = 0;
  int _linkCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'contact.share',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text('Tab'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text('Tab'),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Text('Tab'),
                      ),
                    ),
                  ],
                ),
                Header(
                  label: 'Basic info',
                  icon: Icons.info_outline,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'First name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Header(
                  label: 'Phone',
                  icon: Icons.phone,
                ),
                for (int i = 0; i < _phoneCount; i++)
                  _InputField(
                    onPressed: () => setState(() => _phoneCount--),
                  ),
                AddButton(
                  label: 'phone number',
                  onPressed: () => setState(() => _phoneCount++),
                ),
                Header(
                  label: 'Email',
                  icon: Icons.email,
                ),
                for (int i = 0; i < _emailCount; i++)
                  _InputField(
                    onPressed: () => setState(() => _emailCount--),
                  ),
                AddButton(
                  label: 'email address',
                  onPressed: () => setState(() => _emailCount++),
                ),
                Header(
                  label: 'Social',
                  icon: Icons.person,
                ),
                for (int i = 0; i < _socialCount; i++)
                  _InputField(
                    onPressed: () => setState(() => _socialCount--),
                  ),
                AddButton(
                  label: 'social media',
                  onPressed: () => setState(() => _socialCount++),
                ),
                Header(
                  label: 'Link',
                  icon: Icons.link,
                ),
                for (int i = 0; i < _linkCount; i++)
                  _InputField(
                    onPressed: () => setState(() => _linkCount--),
                  ),
                AddButton(
                  label: 'add link',
                  onPressed: () => setState(() => _linkCount++),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: Colors.blue,
          height: 56,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 16),
          child: InkWell(
            onTap: () {
              showBottomSheet(
                context: context,
                constraints: BoxConstraints(maxHeight: 400),
                builder: (_) {
                  return Center(
                    child: Text('Hello'),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  'Show My Code',
                  style: Theme.of(context)
                      .textTheme
                      .button
                      ?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _InputField extends StatefulWidget {
  final VoidCallback onPressed;
  const _InputField({
    super.key,
    required this.onPressed,
  });

  @override
  State<_InputField> createState() => __InputFieldState();
}

class __InputFieldState extends State<_InputField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Label',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(Icons.delete, color: Colors.red),
        ),
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const AddButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 48,
      margin: const EdgeInsets.all(8),
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.add),
        label: Text('Add $label'),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String label;
  final IconData icon;
  const Header({
    Key? key,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 8),
          Text(label),
        ],
      ),
    );
  }
}
