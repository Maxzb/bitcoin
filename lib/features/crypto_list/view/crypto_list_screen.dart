import 'package:bitcoin/features/crypto_list/service/service.dart';
import 'package:bitcoin/model/user.dart';
import 'package:bitcoin/features/crypto_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    // final mockService = Service();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('CryptoApp'),
        ),
        // leading: Icon(Icons.arrow_back),
      ),

      // 1. С mockData
      // body: FutureBuilder(
      //   future: mockService.getData(),
      //   builder: (context, AsyncSnapshot<CoinsData> snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return ListView.separated(
      //         itemCount: coins.length,
      //         separatorBuilder: (context, indx) => Divider(
      //           color: Colors.white10,
      //         ),
      //         itemBuilder: (context, indx) {
      //           // const coinName = 'Bitcoin';

      //           return ListTile(
      //             leading: SvgPicture.asset(
      //               'assets/svg/bitcoin.svg',
      //               width: 35,
      //               height: 35,
      //             ),
      //             title: Text(
      //               coins[indx].title,
      //               style: theme.textTheme.titleMedium,
      //             ),
      //             subtitle: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   coins[indx].subTitle,
      //                   style: theme.textTheme.titleSmall,
      //                 ),
      //                 Text(
      //                   coins[indx].description,
      //                   style: theme.textTheme.bodySmall,
      //                 ),
      //               ],
      //             ),
      //             trailing: Icon(Icons.arrow_forward_ios),
      //             onTap: () {
      //               Navigator.of(context).pushNamed(
      //                 '/coin',
      //                 arguments: coins[indx],
      //               );
      //             },
      //           );
      //         },
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),

      // 2. С данными с сайта jsonplaceholder.typicode.com
      body: FutureBuilder<List<User>>(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<User> users = snapshot.data!;

            return ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, indx) => Divider(
                color: Colors.white10,
              ),
              itemBuilder: (context, indx) {
                User user = users[indx];

                return CryptoCoinTile(user: user, indx: indx, users: users);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
