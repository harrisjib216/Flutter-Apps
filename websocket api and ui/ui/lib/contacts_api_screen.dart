import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ui/api.dart';
import 'package:ui/contact_listing.dart';

class ContactsApiScreen extends StatefulWidget {
  const ContactsApiScreen({required this.api, super.key});

  final ContactsAPI api;

  @override
  State<ContactsApiScreen> createState() => _ContactsApiScreenState();
}

class _ContactsApiScreenState extends State<ContactsApiScreen> {
  List<Contact> contacts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchContacts();
  }

  void fetchContacts() async {
    final res = await widget.api.getAllContacts();
    setState(() {
      contacts = res;
      loading = false;
    });
  }

  void refresh() {
    fetchContacts();
  }

  void addPerson() async {
    final person = Faker().person;
    final newContact = await widget.api
        .createContact("${person.firstName()} ${person.lastName()}");

    setState(() {
      contacts.add(newContact);
    });
  }

  void removePerson(String name) async {
    await widget.api.deleteContact(name);

    setState(() {
      contacts.removeWhere((element) => element.name == name);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('data: ${contacts.length} one');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mongo Web Socket Appy"),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ContactListing(
              data: contacts,
              addPerson: addPerson,
              onDelete: removePerson,
            ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: refresh,
            tooltip: 'Refresh list',
            backgroundColor: Colors.amber,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: addPerson,
            tooltip: 'Add person',
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.person_add_alt),
          ),
        ],
      ),
    );
  }
}
