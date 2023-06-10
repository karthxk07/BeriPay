ListView.builder(
  itemCount: contacts.length,
  itemBuilder: (context, index) {
    final contact = contacts[index];

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(contact.image),
        radius: 20,
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      // ... Other contact details or actions
    );
  },
)