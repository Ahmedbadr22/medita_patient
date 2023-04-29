import 'package:medita_patient/app/presentation/manager/asset_manager.dart';
import 'package:medita_patient/app/presentation/screens/schedule/eye_test_app/image_model.dart';

List<List<ImageModel>> imageModel = [
  //level 1
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 160.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 160.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 160.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 160.0),
  ],
  //level 2
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 120.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 120.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 120.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 120.0),
  ],
  //level 3
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 100.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 100.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 100.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 100.0),
  ],
  //level 4
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 80.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 80.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 80.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 80.0),
  ],
  //level 5
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 60.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 60.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 60.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 60.0),
  ],
  //level 6
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 40.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 40.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 40.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 40.0),
  ],
  //level 7
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 20.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 20.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 20.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 20.0),
  ],
  //level 8
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 10.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 10.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 10.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 10.0),
  ],
  //level 9
  [
    ImageModel(img: ImageAsset.bottomEyeTest, direction: 0, size: 5.0),
    ImageModel(img: ImageAsset.topEyeTest, direction: 1, size: 5.0),
    ImageModel(img: ImageAsset.leftEyeTest, direction: 2, size: 5.0),
    ImageModel(img: ImageAsset.rightEyeTest, direction: 3, size: 5.0),
  ],
];

List<String> result = [
  //level 1
  'Your vision is 60/6, Near to blindness ',
  //level 2
  'Your vision is 30/6, Mild visual impairment',
  //level 3
  'Your vision is 21/6, Strong visual impairment',
  //level 4
  'Your vision is 15/6, Almost perfect vision',
  //level 5
  'Your vision is 12/6, Consultation of an ophthalmologist',
  //level 6
  'Your vision is 9/6, Difficulty in reading',
  //level 7
  'Your vision is 7.5/6, Almost perfect vision',
  //level 8
  'Your vision is 6/6, Perfect vision',
  //level 9
  'Your vision is 6/6, Perfect vision',
];
