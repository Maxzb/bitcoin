import 'package:bitcoin/data/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.user,
    required this.indx,
    required this.users,
  });

  final User user;
  final int indx;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin.svg',
        width: 35,
        height: 35,
      ),
      title: Text(
        user.name,
        style: theme.textTheme.titleMedium,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.username,
            style: theme.textTheme.titleSmall,
          ),
          Text(
            user.email,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: users[indx],
        );
      },
    );
  }
}
