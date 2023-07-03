import 'package:flutter/material.dart';


class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({required this.name, required this.email, required this.phoneNumber});
}

class ContactList extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Rahim Ahmed', email: 'rahim.ahmed@example.com', phoneNumber: '01711223344'),
    Contact(name: 'Amina Khan', email: 'amina.khan@example.com', phoneNumber: '01898765432'),
    Contact(name: 'Sohail Rahman', email: 'sohail.rahman@example.com', phoneNumber: '01611112222'),
    Contact(name: 'Nadia Islam', email: 'nadia.islam@example.com', phoneNumber: '01555556666'),
    Contact(name: 'Imran Chowdhury', email: 'imran.chowdhury@example.com', phoneNumber: '01333334444'),
    Contact(name: 'Sabina Akter', email: 'sabina.akter@example.com', phoneNumber: '01999998888'),
    Contact(name: 'Kamal Hossain', email: 'kamal.hossain@example.com', phoneNumber: '01444443333'),
    Contact(name: 'Farzana Ahmed', email: 'farzana.ahmed@example.com', phoneNumber: '01777776666'),
    Contact(name: 'Mohammed Ali', email: 'mohammed.ali@example.com', phoneNumber: '01888887777'),
    Contact(name: 'Rina Begum', email: 'rina.begum@example.com', phoneNumber: '01666665555'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.height * 0.5,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Details',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Name: ${contacts[index].name}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Email: ${contacts[index].email}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Phone: ${contacts[index].phoneNumber}',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
