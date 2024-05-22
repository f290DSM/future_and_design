import 'package:faker/faker.dart';
import 'package:future_and_design/src/contacts/domain/contact_domain.dart';

class ContactRepository {
  Future<List<ContactDomain>> getAll() async {
    return List.generate(10, (index) {
      return ContactDomain(
        name: faker.person.name(),
        email: faker.internet.email(),
        urlAvatar: faker.image.image(
          keywords: ['face'],
          random: true,
        ),
        urlImageCard:
            faker.image.image(keywords: ['food'], random: true, width: 1280),
        title: faker.food.dish(),
        content: faker.lorem.sentences(4).join(' '),
      );
    });
  }
}
