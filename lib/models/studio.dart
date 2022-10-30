class YoutubeStudio {
  String image, days;
  int views, likes, comments, realTime;

  YoutubeStudio({
    required this.image,
    required this.days,
    required this.views,
    required this.likes,
    required this.comments,
    required this.realTime,
  });
}

final StudioList = [
  YoutubeStudio(
    image: "meals.png",
    days: "6 days",
    views: 183,
    likes: 15,
    comments: 2,
    realTime: 14,
  ),
  YoutubeStudio(
    image: "cool_drinks.png",
    days: "12 days",
    views: 486,
    likes: 30,
    comments: 9,
    realTime: 4,
  ),
  YoutubeStudio(
    image: "house_hold.png",
    days: "1 month",
    views: 195,
    likes: 14,
    comments: 2,
    realTime: 2,
  ),
  YoutubeStudio(
    image: "shoes_ui.png",
    days: "1 month",
    views: 325,
    likes: 17,
    comments: 5,
    realTime: 2,
  ),
];
