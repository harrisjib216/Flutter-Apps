import 'package:flutter/material.dart';
import 'api.dart';

class ContactListing extends StatelessWidget {
  const ContactListing(
      {required this.data,
      required this.addPerson,
      required this.onDelete,
      super.key});

  final List<Contact> data;
  final VoidCallback addPerson;
  final ValueChanged<String> onDelete;

  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? NoContacts(
            addPerson: addPerson,
          )
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                key: ValueKey(data[index].id),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Text(data[index].initials),
                  ),
                  title: Text(
                    data[index].name,
                    style: const TextStyle(fontSize: 20),
                  ),
                  trailing: MaterialButton(
                    onPressed: () {
                      onDelete(data[index].name);
                    },
                    child: const Icon(
                      Icons.delete_forever,
                      size: 30,
                    ),
                  ),
                ),
              );
            },
          );
  }
}

class NoContacts extends StatelessWidget {
  const NoContacts({required this.addPerson, super.key});

  final VoidCallback addPerson;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.person_add_outlined,
            size: 90,
          ),
          const Text("No contacts found"),
          TextButton(
            onPressed: addPerson,
            child: const Text("Add first person"),
          ),
        ],
      ),
    );
  }
}
