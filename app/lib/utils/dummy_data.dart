import 'package:app/models/haircut.dart';
import 'package:app/models/parlor.dart';
import 'package:app/models/user.dart';

const DUMMY_USER = User(id: 1, name: 'Convidado', email: 'email');

const DUMMY_PARLORS = [
  Parlor(
      id: 1,
      name: "Barbearia do Juninho",
      description: "Barbearia que pica atras",
      imgUrl:
          "https://www.belasis.com.br/wp-content/uploads/2019/09/Sistema-Barbearia-Blogpost-Belasis-Banner.png"),
  Parlor(
      id: 1,
      name: "Barbearia do Juninho",
      description: "Barbearia que pica atras",
      imgUrl:
          "https://www.belasis.com.br/wp-content/uploads/2019/09/Sistema-Barbearia-Blogpost-Belasis-Banner.png"),
  Parlor(
      id: 1,
      name: "Barbearia do Juninho",
      description: "Barbearia que pica atras",
      imgUrl:
          "https://www.belasis.com.br/wp-content/uploads/2019/09/Sistema-Barbearia-Blogpost-Belasis-Banner.png"),
  Parlor(
      id: 1,
      name: "Barbearia do Juninho",
      description: "Barbearia que pica atras",
      imgUrl:
          "https://www.belasis.com.br/wp-content/uploads/2019/09/Sistema-Barbearia-Blogpost-Belasis-Banner.png"),
];

const DUMMY_HAIRCUTS = [
  Haircut(
      id: 1,
      parlorId: 1,
      name: "Corte de cria",
      price: 20.00,
      imgUrl:
          "https://i.pinimg.com/564x/c5/e6/6d/c5e66d6b74a9b574cdefb970ae88b661--hair-cuts-fails.jpg"),
  Haircut(
      id: 1,
      parlorId: 1,
      name: "Corte de cria",
      price: 20.00,
      imgUrl:
          "https://i.pinimg.com/564x/c5/e6/6d/c5e66d6b74a9b574cdefb970ae88b661--hair-cuts-fails.jpg"),
  Haircut(
      id: 1,
      parlorId: 1,
      name: "Corte de cria",
      price: 20.00,
      imgUrl:
          "https://i.pinimg.com/564x/c5/e6/6d/c5e66d6b74a9b574cdefb970ae88b661--hair-cuts-fails.jpg"),
  Haircut(
      id: 1,
      parlorId: 1,
      name: "Corte de cria",
      price: 20.00,
      imgUrl:
          "https://i.pinimg.com/564x/c5/e6/6d/c5e66d6b74a9b574cdefb970ae88b661--hair-cuts-fails.jpg"),
];
