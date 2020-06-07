part of 'services.dart';

class TransactionServices{
  static CollectionReference transactionCollection =
      Firestore.instance.collection('transaction');


   static Future<void> saveTransaction(MovieTransaction movieTransaction) async {
      await transactionCollection.document().setData({
        'userID': movieTransaction.userID,
        'title': movieTransaction.title,
        'subtitle': movieTransaction.subtitle,
        'date': movieTransaction.date,
        'amount': movieTransaction.amount,
        'picture': movieTransaction.picture
      });
   }
   static Future<List<MovieTransaction>> getTransaction(String userID) async {
     QuerySnapshot snapshot = await transactionCollection.getDocuments();

     var documents = snapshot.documents
          .where((document) => document.data[userID] == userID);

     return documents
         .map((object) => MovieTransaction(
         userID: object.data['userID'],
         title:object.data['title'],
         subtitle: object.data['subtitle'],
         date: DateTime.fromMillisecondsSinceEpoch(object.data['date']),
         amount: object.data['amount'],
         picture: object.data['picture']
       )
     ).toList();
   }
}