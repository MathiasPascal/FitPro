// simplified for brevity
class BookingScreen extends StatelessWidget {
  final TextEditingController _dateController = TextEditingController();

  void _submitBooking() {
    FirebaseFirestore.instance.collection('bookings').add({
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'timestamp': _dateController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Session")),
      body: Column(
        children: [
          TextField(
            controller: _dateController,
            decoration: InputDecoration(labelText: "Date"),
          ),
          ElevatedButton(onPressed: _submitBooking, child: Text("Book")),
        ],
      ),
    );
  }
}
