abstract class NetworkService {
  Future<dynamic> getRequest(url);
}

class HTTPsService implements NetworkService {
  @override
  Future<dynamic> getRequest(url) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };
      // http.Response response = await http.get(Uri.parse(url), headers: headers);
      return Future.delayed(
          const Duration(
            seconds: 3,
          ), () {
        return {
          "name": "Fat Burner",
          "image":
              "https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png",
          "description":
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          "video":
              "https://www.youtube.com/watch?v=zU9y354XAgM&ab_channel=TimerTopia",
          "intensity": "Level 4",
          "difficulty": "Easy",
          "totalRunTime": "04 hrs 09 mins",
          "coaches": [
            {
              "name": "Mostafa",
              "image":
                  "https://c8.alamy.com/comp/2BPK95D/close-up-portrait-of-his-he-nice-attractive-cheerful-content-foxy-ginger-guy-sportsman-lifting-barbell-showing-muscles-doing-work-out-isolated-over-2BPK95D.jpg",
              "about":
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            },
          ],
          "classess": [
            {
              "name": "HIIT Cardio",
              "duration": "25:50",
              "description":
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              "url":
                  "https://www.youtube.com/watch?v=zU9y354XAgM&ab_channel=TimerTopia"
            }
          ],
          "posts": [
            {
              "user": {
                "name": "user",
                "image":
                    "https://c8.alamy.com/comp/2BPK95D/close-up-portrait-of-his-he-nice-attractive-cheerful-content-foxy-ginger-guy-sportsman-lifting-barbell-showing-muscles-doing-work-out-isolated-over-2BPK95D.jpg",
              },
              "date": "",
              "comments": "",
              "class_id": 1,
              "at": "29:05",
              "challenge_name": "45 Squats",
            },
          ]
        };
      });
    } catch (e) {
      rethrow;
    }
  }
}
