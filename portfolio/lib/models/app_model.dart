class AppModel {
  final String title;
  final String shortDescription;
  final String longDescription;
  final List<String> screenshots;
  final String image;
  final String playStoreURL;
  final String privacyPolicy;
  final String termsOfService;

  AppModel({
    required this.title,
    required this.shortDescription,
    required this.longDescription,
    required this.screenshots,
    required this.image,
    required this.playStoreURL,
    required this.privacyPolicy,
    required this.termsOfService,
  });

  factory AppModel.fromJson(Map<String, dynamic> json) {
    return AppModel(
      title: json['title'] as String,
      shortDescription: json['description'] as String,
      longDescription: json['longDescription'] as String,
      screenshots: json['screenshots'] as List<String>,
      image: json['image'] as String,
      playStoreURL: json['url'] as String,
      privacyPolicy: json['privacyPolicy'] as String,
      termsOfService: json['termsOfService'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': shortDescription,
      'longDescription': longDescription,
      'screenshots': screenshots,
      'image': image,
      'url': playStoreURL,
      'privacyPolicy': privacyPolicy,
      'termsOfService': termsOfService,
    };
  }

  static List<AppModel> apps = [
    AppModel(
      title: 'Evraka',
      shortDescription:
          'Evraka searches keywords in your various types of files.',
      longDescription:
          'Evraka searches keywords in your various types of files. You can also search in your images, videos. You can search in your pdf, docx, xlsx, pptx, txt, and csv files.',
      screenshots: [
        'assets/images/evraka_ss/1.jpg',
        'assets/images/evraka_ss/2.jpg',
        'assets/images/evraka_ss/3.jpg',
        'assets/images/evraka_ss/4.jpg',
        'assets/images/evraka_ss/5.jpg',
        'assets/images/evraka_ss/6.jpg',
        'assets/images/evraka_ss/7.jpg',
        'assets/images/evraka_ss/8.jpg',
        'assets/images/evraka_ss/9.jpg',
        'assets/images/evraka_ss/10.jpg',
        'assets/images/evraka_ss/11.jpg',
      ],
      image: 'assets/images/evraka_app_icon.png',
      playStoreURL: '',
      privacyPolicy: 'assets/markdowns/evraka_privacy_policy.md',
      termsOfService: 'assets/markdowns/evraka_terms_of_service.md',
    ),
  ];
}
