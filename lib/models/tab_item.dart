enum TabRoute { tribes, socialHub }

class TabItem {
  final String title;
  bool hasNotification;
  TabRoute? route;

  TabItem({required this.title, required this.hasNotification, this.route});
}
