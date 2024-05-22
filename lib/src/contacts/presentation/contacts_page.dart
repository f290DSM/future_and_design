import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:future_and_design/src/contacts/data/contact_repository.dart';
import 'package:future_and_design/src/contacts/domain/contact_domain.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: Center(
        child: FutureBuilder(
          future: ContactRepository().getAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<ContactDomain> resposta = snapshot.data!;

              return ListView.builder(
                itemCount: resposta.length,
                itemBuilder: (context, index) {
                  final contact = resposta[index];
                  return MeuCard(contact: contact);
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class ApenasCard extends StatelessWidget {
  const ApenasCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
            faker.image.image(
              keywords: ['pizza'],
              width: 1280,
              random: true,
            ),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(faker.food.cuisine()),
          ),
        ],
      ),
    );
  }
}

class MeuCard extends StatelessWidget {
  const MeuCard({super.key, required this.contact});
  final ContactDomain contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.secondaryContainer,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondaryContainer,
              Colors.white,
              // Theme.of(context).colorScheme.tertiaryContainer,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ]
          // color: Theme.of(context).colorScheme.secondaryContainer,
          ),
      // height: 150,
      // width: 100,
      // alignment: const Alignment(1, 1),
      // padding: const EdgeInsets.only(bottom: 16, right: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(contact.urlAvatar),
            ),
            title: Text(contact.name),
            subtitle: Text(contact.email),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.sizeOf(context).height * .25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(contact.urlImageCard),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(
              contact.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Text(
              contact.content,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: ButtonBar(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volunteer_activism_outlined,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class MeuCard extends StatelessWidget {
//   const MeuCard({super.key, required this.value});
//   final int value;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           // color: Theme.of(context).colorScheme.secondaryContainer,
//           gradient: LinearGradient(
//             colors: [
//               Theme.of(context).colorScheme.secondaryContainer,
//               Colors.white,
//               // Theme.of(context).colorScheme.tertiaryContainer,
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(16),
//           ),
//           border: Border.all(
//             width: 1,
//             color: Theme.of(context).colorScheme.onSurfaceVariant,
//           ),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black38,
//               offset: Offset(0, 4),
//               blurRadius: 4,
//             )
//           ]
//           // color: Theme.of(context).colorScheme.secondaryContainer,
//           ),
//       // height: 150,
//       // width: 100,
//       // alignment: const Alignment(1, 1),
//       // padding: const EdgeInsets.only(bottom: 16, right: 16),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       // padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             leading: CircleAvatar(
//               radius: 24,
//               backgroundImage: NetworkImage(
//                 faker.image.image(
//                   keywords: ['face'],
//                   random: true,
//                 ),
//               ),
//             ),
//             title: Text(faker.person.name()),
//             subtitle: Text(faker.internet.email()),
//           ),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 16),
//             height: MediaQuery.sizeOf(context).height * .25,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(32),
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                   faker.image.image(
//                     keywords: ['island'],
//                     random: true,
//                     width: 1280,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
//             child: Text(
//               faker.company.person.name(),
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
//             child: Text(
//               faker.lorem.sentences(Random(5).nextInt(5)).join(''),
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 12.0),
//             child: ButtonBar(
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.favorite_outline,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.volunteer_activism_outlined,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {},
//                   icon: const Icon(
//                     Icons.share_outlined,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


